//
//  AddTaskScreen.swift
//  JobAppTracker
//
//  Created by Jack Wong on 10/7/20.
//

import SwiftUI

struct CreateNewJobAppScreen: View {
    @Environment(\.presentationMode) var presentationMode
    @StateObject private var createNewJobAppVM = CreateNewJobAppViewModel()
//    @EnvironmentObject var jobListVM: JobListViewModel
   
    var body: some View {
        NavigationView {
            content
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
        .navigationViewStyle(StackNavigationViewStyle())
    }
    
    var content: some View {
        Form {
            TextField("Enter title", text: $createNewJobAppVM.title)
            
            TextField("Enter Company", text: $createNewJobAppVM.company)
            
            TextField("Enter Location", text: $createNewJobAppVM.location)
            
            DatePicker("Application Date", selection: $createNewJobAppVM.applyDate, displayedComponents: .date)
                .accentColor(.purple)
                .datePickerStyle(CompactDatePickerStyle())
            
            Toggle(isOn: $createNewJobAppVM.remote, label: {
                Text("Remote")
            })
            .toggleStyle(CheckboxToggleStyle())
            
            TextField("URL (Optional)", text: $createNewJobAppVM.url)
            TextField("Salary (Optional)", text: $createNewJobAppVM.salary)
            
            Picker(selection: $createNewJobAppVM.status, label: Text("Status"), content: /*@START_MENU_TOKEN@*/{
                ForEach(ApplicationStatus.allCases) { status in
                    Text(status.id.capitalized).tag(status)
                }
            }/*@END_MENU_TOKEN@*/)
            
            Section(header: Text("Notes")) {
                TextEditor(text: $createNewJobAppVM.notes)
            }
        }
        .autocapitalization(.none)
    }
    
    private func submitPressed() {
        createNewJobAppVM.addJob()
        
        presentationMode.wrappedValue.dismiss()
    }
    
    private func cancelPressed() {
        presentationMode.wrappedValue.dismiss()
    }
}
