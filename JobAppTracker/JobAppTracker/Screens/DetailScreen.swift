//
//  DetailScreen.swift
//  JobAppTracker
//
//  Created by Jack Wong on 10/7/20.
//

import SwiftUI

struct DetailScreen: View {
    let job: Job
    @ObservedObject var jobListVM: JobListViewModel
    @State private var edit = false
    @State private var showingAlert = false
    
    var body: some View {
        
        ZStack(alignment: .bottom) {
            VStack() {
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
                    RingView(width: 60, height: 60)
                }
                
                Text("Applied on: \(job.appliedDate.toString(.medium))")
                    .font(Font.caption.weight(.semibold))
                
                Text("Status: \(job.status)")
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
            
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.background.ignoresSafeArea())
        
        
        floatingActionButtons
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
                
                //MARK: - Edit Button
                Button {
                    print("edit button pressed")
                    edit = true
                } label: {
                    Image(systemName: "pencil.circle.fill")
                        .resizable()
                        .frame(width: 56, height: 56)
                        .foregroundColor(Color.orange)
                }
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
