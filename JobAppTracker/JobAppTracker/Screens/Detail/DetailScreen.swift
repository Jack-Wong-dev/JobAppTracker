//
//  DetailScreen.swift
//  JobAppTracker
//
//  Created by Jack Wong on 10/7/20.
//

import SwiftUI

struct DetailScreen: View {
    
    @EnvironmentObject var jobListVM: JobListViewModel
    
    @State private var showingAlert = false
    @State private var show = false
        
    var jobInfo: Job
    var namespace: Namespace.ID
    
    var body: some View {
        ZStack(alignment: .bottom) {
            NeumorphicCard()
                .matchedGeometryEffect(id: "Job \(String(describing: jobInfo.id))", in: namespace)
            
            VStack(alignment: .leading) {
                //MARK: - Header
                HStack(alignment: .top) {
                    VStack(alignment: .leading) {
                        Text(jobInfo.title)
                            .font(.title2).bold()
                        
                        Text(jobInfo.companyName)
                            .font(Font.headline.weight(.bold))
                        
                        Text(jobInfo.location)
                            .font(Font.headline.weight(.semibold))
                        
                        if jobInfo.remote == true {
                            Text("Remote")
                        }
                        
                        if !jobInfo.salary.isEmpty {
                            Text("Salary: \(jobInfo.salary)")
                        }
                    } /* VStack */
                    .font(Font.subheadline.weight(.semibold))
                    
                    Spacer()
                    
                    RingView(status: jobInfo.status, width: 60, height: 60)
                } /* HStack */
                .matchedGeometryEffect(id: "Header \(String(describing: jobInfo.id))", in: namespace)
                
                Text("Applied on: \(jobInfo.appliedDate.toString(.medium))")
                    .font(Font.caption.weight(.semibold))
                    .matchedGeometryEffect(id: "Date \(String(describing: jobInfo.id))", in: namespace)
                
                HStack {
                    Text("Status: ")
                    
                    Text(jobInfo.status.id.capitalized)
                        .foregroundColor(Color(jobInfo.status.color))
                        .fontWeight(.heavy)
                }
                .font(Font.callout.weight(.semibold))
                .matchedGeometryEffect(id: "Status \(String(describing: jobInfo.id))", in: namespace)
                
                if !jobInfo.notes.isEmpty {
                    Text(jobInfo.notes)
                        .font(Font.body.weight(.semibold))
                        .opacity(show ? 1 : 0)
                        .animation(Animation.easeOut.delay(0.4))
                        .offset(y: show ? 0 : 20)
                }
                
                Spacer(minLength: 70)
            } /* VStack */
            .padding()
            
            floatingActionButtons
                .opacity(show ? 1 : 0)
                .animation(Animation.easeOut.delay(0.4))
                .offset(y: show ? 0 : 20)
        } /* ZStack */
        .animation(.easeOut) //Opening animation
        .onAppear(perform: {
            show.toggle()
        })
    }
    
    var floatingActionButtons: some View {
        VStack {
            HStack {
                //MARK: - Delete Button
                Button {
                    showingAlert = true
                } label: {
                    Image(systemName: "trash.circle.fill")
                        .resizable()
                        .frame(width: 56, height: 56)
                        .foregroundColor(Color.orange)
                        .shadow(color: Color.shadow, radius: 5, x: 5, y: 5)
                }
                .buttonStyle(FABStyle())
                .alert(isPresented:$showingAlert) {
                    Alert(
                        title: Text("Are you sure you want to delete this?"),
                        message: Text("You cannot undo this."),
                        primaryButton: .destructive(Text("Delete")) {
                            print("Deleting...")
                            deleteAction()
                        },
                        secondaryButton: .cancel())
                }
                
                Spacer()
                
                //MARK: - Exit Button
                Button {
                    jobListVM.selectedJob = nil
                } label: {
                    Image(systemName: "xmark.circle.fill")
                        .resizable()
                        .frame(width: 56, height: 56)
                        .foregroundColor(Color.orange)
                        .shadow(color: Color.shadow, radius: 5, x: 5, y: 5)
                }
                .buttonStyle(FABStyle())
                
                Spacer()
                
                //MARK: - Update Button
                Button {
                    jobListVM.intent = .update
                } label: {
                    Image(systemName: "pencil.circle.fill")
                        .resizable()
                        .frame(width: 56, height: 56)
                        .foregroundColor(Color.orange)
                        .shadow(color: Color.shadow, radius: 5, x: 5, y: 5)
                }
                .buttonStyle(FABStyle())
                
            } /* HStack */
            .padding(.horizontal)
            
            Spacer().frame(height: 70)
        } /* VStack */
    }
    
    //MARK:- Methods
    private func deleteAction() {
        jobListVM.deleteJob(job: jobInfo)
        jobListVM.selectedJob = nil
    }
}
