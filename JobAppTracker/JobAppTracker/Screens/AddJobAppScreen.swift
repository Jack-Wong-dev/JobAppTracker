//
//  AddTaskScreen.swift
//  JobAppTracker
//
//  Created by Jack Wong on 10/7/20.
//

import SwiftUI

struct AddJobAppScreen: View {
    @Environment(\.presentationMode) var presentationMode
    
    @ObservedObject var jobListVM: JobListViewModel
    
    @State private var title = ""
    @State private var company = ""
    @State private var location = ""
    @State private var applyDate = Date()
    @State private var status = ""
    @State private var remote = false
    @State private var url = ""
    @State private var salary = ""
    @State private var notes = ""
    
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Enter title", text: $title)
                TextField("Enter Company", text: $company)
                TextField("Enter Location", text: $location)
                DatePicker("Application Date", selection: $applyDate, displayedComponents: .date)
                    .accentColor(.purple)
                    .datePickerStyle(CompactDatePickerStyle())
                Toggle(isOn: $remote, label: {
                    Text("Remote")
                })
                .toggleStyle(CheckboxToggleStyle())
                TextField("Enter Status", text:$status)
                TextField("URL (Optional)", text: $url)
                TextField("Salary (Optional)", text: $salary)

                Section(header: Text("Notes")) {
                    TextEditor(text: $notes)
                }
            }
            .autocapitalization(.none)
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

        jobListVM.addJob(job: Job(title: title, companyName: company, location: location, appliedDate: applyDate, status: status, remote: remote, url: url, salary: salary, notes: notes))
        
        presentationMode.wrappedValue.dismiss()
    }
    
    private func cancelPressed() {
        print("cancel pressed")
        presentationMode.wrappedValue.dismiss()
    }
}
