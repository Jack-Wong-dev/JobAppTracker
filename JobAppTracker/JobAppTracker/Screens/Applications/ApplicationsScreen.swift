//
//  ActiveApplicationsView.swift
//  JobAppTracker
//
//  Created by Jack Wong on 10/6/20.
//

import SwiftUI

struct ApplicationsScreen: View {
    @StateObject var jobListVM = JobListViewModel()
    @Namespace var namespace
    @State private var columns = [GridItem(.adaptive(minimum: 300), spacing: 40)]
    @State private var editMode = false
    
    var jobSelected: Bool { jobListVM.selectedJob != nil }
    
    var body: some View {
        GeometryReader { proxy in
            ZStack(alignment: .bottomTrailing) {
                ScrollView(showsIndicators: false) {
                    JobGridView(namespace: namespace)
                        .padding(.top, proxy.safeAreaInsets.top)
                        .padding(.bottom, proxy.safeAreaInsets.bottom)
                        .padding(.leading, proxy.safeAreaInsets.leading)
                        .padding(.trailing, proxy.safeAreaInsets.trailing)
                }
                .ignoresSafeArea()
            }  /* ZStack */
            .blur(radius: jobSelected ? 10: 0)
            .disabled(jobSelected)
            .overlay(
                Unwrap(jobListVM.selectedJob) { job in
                    DetailScreen(job: job, namespace: namespace)
                        .frame(maxWidth: proxy.size.width * 0.85, maxHeight: proxy.size.height * 0.85)
                }
            )
        }
        .environmentObject(jobListVM)
    }
}

struct JobGridView: View {
    @EnvironmentObject var jobListVM: JobListViewModel
    @State private var columns = [GridItem(.adaptive(minimum: 300), spacing: 40)]
    
    var namespace: Namespace.ID
    
    var body: some View {
        LazyVGrid(columns: columns, spacing: 40) {
            ForEach(jobListVM.jobsList) { job in
                if job.id != jobListVM.selectedJob?.id {
                    JobCard(job: job, namespace: namespace)
                        .zIndex(job.id == jobListVM.lastSelectedJob?.id ? 2 : 1)
                    /* Logic for zIndex is required to prevent card from being
                     behind other cards when going from DetailScreen back to card */
                } else {
                    Color.clear
                        .frame(height: 200)
                }
            }  /* ForEach */
            
        } /* LazyVGrid */
        .padding()
    }
    
    private func selectCard(for job: Job) {
        jobListVM.selectedJob = job
        jobListVM.lastSelectedJob = job
    }
}


struct JobCard: View {
    @EnvironmentObject var router: Router
    @EnvironmentObject var jobListVM: JobListViewModel
    
    let job: Job
    var namespace: Namespace.ID
    
    var body: some View {
        JobCardView(job: job, namespace: namespace)
            .onTapGesture(perform: selectCard)
    }
    
    private func selectCard() {
        router.showNavigation = false

        withAnimation(.easeOut) {
            jobListVM.selectedJob = job
            jobListVM.lastSelectedJob = job
        }
    }
}

struct ActiveApplicationsView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            ApplicationsScreen()
        }
        .background(Color.background.ignoresSafeArea())
        .previewDevice("iPhone 12 Pro")
    }
}
