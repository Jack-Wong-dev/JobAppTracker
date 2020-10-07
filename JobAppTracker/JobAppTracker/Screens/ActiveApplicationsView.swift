//
//  ActiveApplicationsView.swift
//  JobAppTracker
//
//  Created by Jack Wong on 10/6/20.
//

import SwiftUI

struct ActiveApplicationsView: View {
    
    @ObservedObject var jobListVM = JobListViewModel()
    
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
                print("button pressed")
                jobListVM.addJob(job: Job(title: "iOS Developer", companyName: "Facebook", location: "New York", appliedDate: "10/17/2020", status: "Applied"))
            }, label: {
                Image(systemName: "plus.circle.fill")
                    .resizable()
                    .frame(width: 100, height: 100)
            })
            
            
            Spacer().frame(height: 70)
        }
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


