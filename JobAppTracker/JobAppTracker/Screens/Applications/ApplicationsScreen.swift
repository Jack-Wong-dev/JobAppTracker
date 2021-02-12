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
                    
                    Spacer().frame(height: 70)
                }
            }  /* ZStack */
            .blur(radius: jobSelected ? 3: 0)
            .disabled(jobSelected)
            .overlay(
                Unwrap(jobListVM.selectedJob) { job in
                    DetailScreen(job: job, namespace: namespace)
                        .frame(maxWidth: 712)
                }
            )
        }
        .environmentObject(jobListVM)
    }
}

struct FloatingActionButton: View {
    let systemName: String
    var color = Color(#colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1))
    let action: () -> Void
    
    var body: some View {
        VStack {
            Button(action: action) {
                Image(systemName: "plus.circle.fill")
                    .resizable()
                    .foregroundColor(Color(#colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)))
                    .frame(width: 56, height: 56)
                    .shadow(color: Color.shadow, radius: 5, x: 5, y: 5)
            }
            .buttonStyle(FABStyle())
            .padding(.horizontal)
        }
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
                        .animation(.easeInOut) //Closing animation
                        .zIndex(job.id == jobListVM.lastSelectedJob?.id ? 2 : 1)
                    /* Logic for zIndex is required to prevent card from being
                     behind other cards when going from DetailScreen back to card */
                } else {
                    Color.clear
                        .frame(height: 200)
                        .animation(.easeInOut) //Closing animation
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
        jobListVM.selectedJob = job
        jobListVM.lastSelectedJob = job
        
        DispatchQueue.main.async {
            router.showTabBar = false
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
