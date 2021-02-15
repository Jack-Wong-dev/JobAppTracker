//
//  DetailScreen.swift
//  JobAppTracker
//
//  Created by Jack Wong on 10/7/20.
//

import SwiftUI

struct DetailScreen: View {
    @EnvironmentObject var router: Router
    @EnvironmentObject var jobListVM: JobListViewModel
    @ScaledMetric private var imageSize: CGFloat = 48
    
    @State private var showingAlert = false
    @State private var show = false
    @State private var presentEditing = false
        
    let job: Job
    var namespace: Namespace.ID
    
    var body: some View {
        ZStack(alignment: .bottom) {
            NeumorphicCard()
                .matchedGeometryEffect(id: "Job \(String(describing: job.id))", in: namespace)
                .overlay(
                    VStack(alignment: .leading, spacing: 20) {
                        //MARK: - Header
                        HStack(alignment: .top) {
                            VStack(alignment: .leading) {
                                Text(job.title)
                                    .font(.title2).bold()
                                
                                Text(job.companyName)
                                    .font(Font.headline.weight(.bold))
                                
                                Text(job.location)
                                    .font(Font.headline.weight(.semibold))
                                
                                if job.remote { Text("Remote") }
                                
                                if !job.salary.isEmpty { Text("Salary: \(job.salary)")  }
                            } /* VStack */
                            .font(Font.subheadline.weight(.semibold))
                            
                            Spacer()
                            
                            RingView(status: job.status, width: 60, height: 60)
                        } /* HStack */
                        .matchedGeometryEffect(id: "Header \(String(describing: job.id))", in: namespace)
                        
                        Text("Applied on: \(job.appliedDate.toString(.medium))")
                            .font(Font.caption.weight(.semibold))
                            .matchedGeometryEffect(id: "Date \(String(describing: job.id))", in: namespace)
                        
                        HStack {
                            Text("Status: ")
                            Text(job.status.id.capitalized)
                                .foregroundColor(Color(job.status.color))
                                .fontWeight(.heavy)
                        }
                        .font(Font.callout.weight(.semibold))
                        .matchedGeometryEffect(id: "Status \(String(describing: job.id))", in: namespace)
                        
                        if !job.notes.isEmpty {
                            Text(job.notes)
                                .font(Font.body.weight(.semibold))
                                .opacity(show ? 1 : 0)
                                .offset(y: show ? 0 : 20)
                        }
                        
                        Spacer(minLength: 0)
                    } /* VStack */
                    .padding()
                )
            
            floatingActionButtons
                .opacity(show ? 1 : 0)
                .offset(y: show ? 0 : 20)
        } /* ZStack */
        .onAppear(perform: onAppear)
        .fullScreenCover(isPresented: $presentEditing) {
            UpdateScreen(job: job)
        }
    }
    
    var floatingActionButtons: some View {
        VStack {
            HStack {
                //MARK: - Delete Button
                Button(action: showAlert) {
                    Image(systemName: "trash.circle.fill")
                        .resizable()
                        .frame(width: imageSize, height: imageSize)
                        .foregroundColor(Color.orange)
                        .shadow(color: Color.shadow, radius: 5, x: 5, y: 5)
                }
                .buttonStyle(FABStyle())
                .alert(isPresented:$showingAlert) {
                    Alert(
                        title: Text("Are you sure you want to delete this?"),
                        message: Text("You cannot undo this."),
                        primaryButton: .destructive(Text("Delete"), action: deleteAction),
                        secondaryButton: .cancel())
                }
                
                Spacer()
                
                //MARK: - Exit Button
                Button(action: exit) {
                    Image(systemName: "xmark.circle.fill")
                        .resizable()
                        .frame(width: imageSize, height: imageSize)
                        .foregroundColor(Color.orange)
                        .shadow(color: Color.shadow, radius: 5, x: 5, y: 5)
                }
                .buttonStyle(FABStyle())
                
                Spacer()
                
                //MARK: - Update Button
                Button(action: startEditing) {
                    Image(systemName: "pencil.circle.fill")
                        .resizable()
                        .frame(width: imageSize, height: imageSize)
                        .foregroundColor(Color.orange)
                        .shadow(color: Color.shadow, radius: 5, x: 5, y: 5)
                }
                .buttonStyle(FABStyle())
                
            } /* HStack */
            .padding(.horizontal)
        } /* VStack */
    }
    
    //MARK:- Methods
    private func onAppear() {
        withAnimation(Animation.easeOut.delay(0.4)) {
            show.toggle()
        }
    }
    
    private func deleteAction() {
        withAnimation(.easeInOut) {
            jobListVM.deleteJob(job: job)
            jobListVM.selectedJob = nil
        }
        
        revealTabBar()
    }
    
    private func showAlert() {
        showingAlert = true
    }
    
    private func startEditing() {
        presentEditing = true
    }
    
    private func exit() {
        withAnimation(.easeInOut) {
            jobListVM.selectedJob = nil
        }
        revealTabBar()
    }
    
    private func revealTabBar() {
        withAnimation(Animation.easeOut.delay(0.2)) {
            router.showNavigation = true
        }
    }
}
