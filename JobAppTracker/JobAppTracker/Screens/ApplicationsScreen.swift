//
//  ActiveApplicationsView.swift
//  JobAppTracker
//
//  Created by Jack Wong on 10/6/20.
//

import SwiftUI

struct ApplicationsScreen: View {
    
    @Namespace var namespace
    
    @StateObject var jobListVM = JobListViewModel()
    
    @State private var columns = [GridItem(.adaptive(minimum: 300), spacing: 40)]
    @State private var lastSelectedJob: Job?
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            ScrollView(showsIndicators: false) {
                content
                    .padding()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                Spacer()
                    .frame(height: 70)
            }
            
            floatingActionButton
        }  /* ZStack */
        .disabled(jobListVM.selectedJob != nil)
        .overlay(
            Group {
                if let jobToShow = jobListVM.selectedJob {
                    DetailScreen(jobInfo: jobToShow, namespace: namespace)
                }
            }
        )
        .fullScreenCover(item: $jobListVM.intent) { intent in
            if intent == .create {
                AddJobAppScreen()
            } else if let job = jobListVM.selectedJob {
                UpdateScreen(job: job)
            }
        }
        .environmentObject(jobListVM)
    }
    
    var content: some View {
        LazyVGrid(columns: columns, spacing: 40) {
            ForEach(jobListVM.jobsList) { job in
                if job.id != jobListVM.selectedJob?.id {
                    JobCard(job: job, namespace: namespace)
                        .onTapGesture() {
                            jobListVM.selectedJob = job
                            lastSelectedJob = job
                        }
                        .animation(.easeInOut) //Closing animation
                        .zIndex(job.id == lastSelectedJob?.id ? 2 : 1)
                    /* Logic for zIndex is required to prevent card from being
                     behind other cards when going from DetailScreen back to card */
                } else {
                    Color.clear
                        .frame(height: 200)
                        .animation(.easeInOut) //Closing animation
                }
            }  /* ForEach */
        } /* LazyVGrid */
    }
    
    var floatingActionButton: some View {
        VStack {
            Button(action: {
                jobListVM.intent = .create
            }, label: {
                Image(systemName: "plus.circle.fill")
                    .resizable()
                    .foregroundColor(Color(#colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)))
                    .frame(width: 56, height: 56)
                    .shadow(color: Color.shadow, radius: 5, x: 5, y: 5)
            })
            .buttonStyle(FABStyle())
            .padding(.horizontal)
            
            Spacer().frame(height: 70)
        }
    }
}

struct ActiveApplicationsView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            ApplicationsScreen()
        }
        .background(Color.background.ignoresSafeArea())
        .previewDevice("iPhone 11 Pro")
    }
}
