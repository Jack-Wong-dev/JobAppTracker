//
//  AddTaskScreen.swift
//  JobAppTracker
//
//  Created by Jack Wong on 10/7/20.
//

import SwiftUI

struct AddJobAppScreen: View {
    
    @ObservedObject var jobListVM: JobListViewModel
    @Binding var showSheet: Bool
    
    @State private var title = ""
    @State private var company = ""
    @State private var location = ""
    @State private var applyDate = Date()
    @State private var status = ""
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Enter title", text: $title)
                TextField("Enter Company", text: $company)
                TextField("Enter Location", text: $location)
                DatePicker("Application Date", selection: $applyDate, displayedComponents: .date)
                    .accentColor(.purple)
                    .datePickerStyle(CompactDatePickerStyle())
                TextField("Enter Status", text:$status)
            }
            .navigationTitle("Add Job Application")
            .toolbar(content: {
                ToolbarItem(placement: ToolbarItemPlacement.cancellationAction) {
                    Button(action: {
                        cancelPressed()
                    }, label: {
                        Text("Cancel")
                    })
                }
                
                ToolbarItem(placement: ToolbarItemPlacement.confirmationAction) {
                    Button(action: {
                        submitPressed()
                    }, label: {
                        Text("Submit")
                    })
                }
            })
        }
    }
    
    private func submitPressed() {
        print("submit pressed")

        jobListVM.addJob(job: Job(title: title, companyName: company, location: location, appliedDate: applyDate, status: status))

        showSheet = false
    }
    
    private func cancelPressed() {
        print("cancel pressed")
        showSheet = false
    }
}


