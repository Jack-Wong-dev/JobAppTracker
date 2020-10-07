//
//  ActiveApplicationsView.swift
//  JobAppTracker
//
//  Created by Jack Wong on 10/6/20.
//

import SwiftUI

struct ActiveApplicationsView: View {
    
    @ObservedObject var jobListVM = JobListViewModel()
    @State var showSheet = false
    
    
    @State var title = ""
    @State var company = ""
    @State var location = ""
    @State var appliedOn = ""
    @State var status = ""
    
    var body: some View {
        
        ScrollView(showsIndicators: false) {
            LazyVStack(spacing: 16) {
                ForEach(jobListVM.jobsList) { job in
                    JobCard(job: job)
                        .frame(width: 300, height: 300)
                }
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            Button(action: {
               showSheet = true
            }, label: {
                Image(systemName: "plus.circle.fill")
                    .resizable()
                    .frame(width: 100, height: 100)
            })
            .modifier(Neumorphic())
            
            
            Spacer().frame(height: 70)
        }
        .sheet(isPresented: $showSheet, content: {
            AddTaskScreen(jobListVM: jobListVM, showSheet: $showSheet)
        })
    }
}

struct ActiveApplicationsView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            ActiveApplicationsView()
        }
        .background(Color.background.ignoresSafeArea())
        .previewDevice("iPhone 11 Pro")
    }
}


