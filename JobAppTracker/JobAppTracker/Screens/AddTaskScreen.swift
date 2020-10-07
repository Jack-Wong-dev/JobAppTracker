//
//  AddTaskScreen.swift
//  JobAppTracker
//
//  Created by Jack Wong on 10/7/20.
//

import SwiftUI

struct AddTaskScreen: View {
    
    @ObservedObject var jobListVM: JobListViewModel
    @Binding var showSheet: Bool
    
    @State var title = ""
    @State var company = ""
    @State var location = ""
    @State var appliedOn = ""
    @State var status = ""
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Enter title", text: $title)
                TextField("Enter Company", text: $company)
                TextField("Enter Location", text: $location)
                TextField("Enter Application Date", text:$appliedOn)
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
        
        jobListVM.addJob(job: Job(title: title, companyName: company, location: location, appliedDate: appliedOn, status: status))
        
        showSheet = false
    }
    
    private func cancelPressed() {
        print("cancel pressed")
        showSheet = false
    }
}

