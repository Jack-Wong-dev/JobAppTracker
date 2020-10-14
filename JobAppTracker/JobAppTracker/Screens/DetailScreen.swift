//
//  DetailScreen.swift
//  JobAppTracker
//
//  Created by Jack Wong on 10/7/20.
//

import SwiftUI

struct DetailScreen: View {
    @State var job: Job
    @ObservedObject var jobListVM: JobListViewModel
    @State private var showingAlert = false
    
    var namespace: Namespace.ID
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .bottom) {
                VStack(alignment: .leading) {
                    HStack {
                        VStack(alignment: .leading) {
                            Text(job.title)
                                .font(.title2).bold()
                            Text(job.companyName)
                                .font(Font.headline.weight(.semibold))
                            Text(job.location)
                                .font(Font.subheadline.weight(.semibold))
                        }
                        Spacer()
                        RingView(status: job.status, width: 60, height: 60)
                    }
                    
                    Text("Applied on: \(job.appliedDate.toString(.medium))")
                        .font(Font.caption.weight(.semibold))
                    
                    Text("Status: \(job.status.id.capitalized)")
                        .font(Font.callout.weight(.semibold))
                    
                    if job.remote == true {
                        Text("Remote: \(job.remote.description)")
                    }
                    
                    if !job.salary.isEmpty {
                        Text(job.salary)
                            .font(Font.body.weight(.semibold))
                    }
                    
                    if !job.notes.isEmpty {
                        Text(job.notes)
                            .font(Font.body.weight(.semibold))
                    }
                    
                    Spacer()
                    
                }
                
                floatingActionButtons
                
            }
            .padding()
            .matchedGeometryEffect(id: job.id, in: namespace)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(
                LinearGradient(
                    gradient: Gradient(colors: [Color.gradientStart, Color.gradientEnd]),
                    startPoint: .topLeading, endPoint: .bottomTrailing
                )
                .ignoresSafeArea()
            )
            .navigationBarHidden(true)
        }
        .navigationViewStyle(StackNavigationViewStyle())
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
                }
                .alert(isPresented:$showingAlert) {
                    Alert(
                        title: Text("Are you sure you want to delete this?"),
                        message: Text("There is no undo"),
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
                }
                
                Spacer()
                
                NavigationLink(
                    destination: UpdateView(jobListVM: jobListVM, job: job) { updatedJob in
                        job = updatedJob
                    },
                    label: {
                        Image(systemName: "pencil.circle.fill")
                            .resizable()
                            .frame(width: 56, height: 56)
                            .foregroundColor(Color.orange)
                    })
            }
            .padding(.horizontal)
            
            
            Spacer().frame(height: 70)
        }
    }
    
    private func deleteAction() {
        jobListVM.deleteJob(job: job)
        jobListVM.selectedJob = nil
    }
    
}

