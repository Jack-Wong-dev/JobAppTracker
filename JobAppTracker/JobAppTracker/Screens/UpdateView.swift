//
//  UpdateView.swift
//  JobAppTracker
//
//  Created by Jack Wong on 10/11/20.
//

import SwiftUI

struct UpdateView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var jobListVM: JobListViewModel

    @State var job: Job
    
//    var completion: (_ job: Job) -> Void
    
    var body: some View {
        
        NavigationView {
            Form {
                TextField("Enter title", text: $job.title)
                TextField("Enter Company", text: $job.companyName)
                TextField("Enter Location", text: $job.location)
                DatePicker("Application Date", selection: $job.appliedDate, displayedComponents: .date)
                    .accentColor(.purple)
                    .datePickerStyle(CompactDatePickerStyle())
                Toggle(isOn: $job.remote, label: {
                    Text("Remote")
                })
                .toggleStyle(CheckboxToggleStyle())
                TextField("URL (Optional)", text: $job.url)
                TextField("Salary (Optional)", text: $job.salary)
                
                Picker(selection: $job.status, label: Text("Status"), content: /*@START_MENU_TOKEN@*/{
                    ForEach(ApplicationStatus.allCases) { status in
                        Text(status.id.capitalized).tag(status)
                    }
                }/*@END_MENU_TOKEN@*/)
                
                Section(header: Text("Notes")) {
                    TextEditor(text: $job.notes)
                }
            }
            .autocapitalization(.none)
            .navigationTitle("Update Job Application")
            .toolbar(content: {
                ToolbarItem(placement: ToolbarItemPlacement.cancellationAction) {
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }, label: {
                        Text("Cancel")
                    })
                }
                
                ToolbarItem(placement: ToolbarItemPlacement.confirmationAction) {
                    Button(action: {
                        updatePressed()
                    }, label: {
                        Text("Update")
                    })
                }
            })
        }
    }
    
    private func updatePressed() {
        print("update pressed")
        
        jobListVM.updateJob(job: job)
        jobListVM.selectedJob = nil
//        completion(job)
        
        presentationMode.wrappedValue.dismiss()
    }
    
}

