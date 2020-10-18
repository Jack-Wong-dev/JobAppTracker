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
    
    var jobInfo: Job
    var namespace: Namespace.ID
    
    var body: some View {
            ZStack(alignment: .bottom) {
                VStack(alignment: .leading) {
                    HStack {
                        VStack(alignment: .leading) {
                            Text(jobInfo.title)
                                .font(.title2).bold()
                            Text(jobInfo.companyName)
                                .font(Font.headline.weight(.semibold))
                            Text(jobInfo.location)
                                .font(Font.subheadline.weight(.semibold))
                        }
                        Spacer()
                        RingView(status: jobInfo.status, width: 60, height: 60)
                    }
                    
                    Text("Applied on: \(jobInfo.appliedDate.toString(.medium))")
                        .font(Font.caption.weight(.semibold))
                    
                    Text("Status: \(jobInfo.status.id.capitalized)")
                        .font(Font.callout.weight(.semibold))
                    
                    if jobInfo.remote == true {
                        Text("Remote: \(jobInfo.remote.description)")
                    }
                    
                    if !jobInfo.salary.isEmpty {
                        Text(jobInfo.salary)
                            .font(Font.body.weight(.semibold))
                    }
                    
                    if !jobInfo.notes.isEmpty {
                        Text(jobInfo.notes)
                            .font(Font.body.weight(.semibold))
                    }
                    
                    Spacer()
                    
                }
                
                floatingActionButtons
                
            }
            .padding()
            .matchedGeometryEffect(id: jobInfo.id, in: namespace)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(
                LinearGradient(
                    gradient: Gradient(colors: [Color.gradientStart, Color.gradientEnd]),
                    startPoint: .topLeading, endPoint: .bottomTrailing
                )
                .ignoresSafeArea()
//                .matchedGeometryEffect(id: jobInfo.id, in: namespace)

            )
//            .animation(.default) //Opening animation
            .animation(.easeOut) //Opening animation



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
                
                Button {
                    jobListVM.intent = .update
                } label: {
                    Image(systemName: "xmark.circle.fill")
                        .resizable()
                        .frame(width: 56, height: 56)
                        .foregroundColor(Color.orange)
                }
                
//                NavigationLink(
//                    destination: UpdateView(jobListVM: jobListVM, job: jobInfo) { updatedJob in
//                        jobInfo = updatedJob
//                    },
//                    label: {
//                        Image(systemName: "pencil.circle.fill")
//                            .resizable()
//                            .frame(width: 56, height: 56)
//                            .foregroundColor(Color.orange)
//                    })
            }
            .padding(.horizontal)
            
            
            Spacer().frame(height: 70)
        }
    }
    
    private func deleteAction() {
        jobListVM.deleteJob(job: jobInfo)
        jobListVM.selectedJob = nil
    }
    
}

