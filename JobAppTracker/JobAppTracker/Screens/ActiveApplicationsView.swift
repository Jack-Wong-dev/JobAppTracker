//
//  ActiveApplicationsView.swift
//  JobAppTracker
//
//  Created by Jack Wong on 10/6/20.
//

import SwiftUI

struct ActiveApplicationsView: View {
    
    @StateObject var jobListVM = JobListViewModel()
    
    var body: some View {
        
//        NavigationView {
            ScrollView(showsIndicators: false) {
                LazyVStack(spacing: 16) {
                    ForEach(jobData) { job in
                        JobCard(job: job)
                            .frame(width: 300, height: 300)
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                
                Spacer().frame(height: 70)
            }
            .background(Color.offWhite.ignoresSafeArea())
//        }
//        .navigationViewStyle(StackNavigationViewStyle())

    }
}

struct ActiveApplicationsView_Previews: PreviewProvider {
    static var previews: some View {
        ActiveApplicationsView()
            .previewDevice("iPhone 11 Pro")
    }
}


let jobData = [
    Job(title: "iOS Engineer", companyName: "Snap", location: "New York", appliedDate: "Jun 25, 2020", status: "Applied"),
    Job(title: "iOS Engineer", companyName: "Snap", location: "New York", appliedDate: "Jun 25, 2020", status: "Applied"),
    Job(title: "iOS Engineer", companyName: "Snap", location: "New York", appliedDate: "Jun 25, 2020", status: "Applied"),
    Job(title: "iOS Engineer", companyName: "Snap", location: "New York", appliedDate: "Jun 25, 2020", status: "Applied"),
    Job(title: "iOS Engineer", companyName: "Snap", location: "New York", appliedDate: "Jun 25, 2020", status: "Applied"),
    Job(title: "iOS Engineer", companyName: "Snap", location: "New York", appliedDate: "Jun 25, 2020", status: "Applied"),
]
