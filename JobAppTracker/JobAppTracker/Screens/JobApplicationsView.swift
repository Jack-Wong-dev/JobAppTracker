//
//  ActiveApplicationsView.swift
//  JobAppTracker
//
//  Created by Jack Wong on 10/6/20.
//

import SwiftUI

struct JobApplicationsView: View {
    
    @Namespace var namespace
    
    @StateObject var jobListVM = JobListViewModel()
    
    @State private var columns = [GridItem(.adaptive(minimum: 300), spacing: 40)]
    
    var body: some View {
        
        ZStack(alignment: .bottomTrailing) {
            ScrollView(showsIndicators: false) {
                LazyVGrid(columns: columns, spacing: 40) {
                    ForEach(jobListVM.jobsList) { job in
                        if job.id != jobListVM.selectedJob?.id {
                            JobCard(job: job)
                                .onTapGesture() {
                                    jobListVM.selectedJob = job
                                }
                                .matchedGeometryEffect(id: job.id, in: namespace)
                                .animation(.easeInOut) //Closing animation
                                .animation(.none)
                                .zIndex(1)
                                .frame(height: 200)
                        } else {
                            Color.clear
                                .frame(height: 200)
                        }
                    }  /* ForEach */
                } /* LazyVGrid */
                .padding()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                
                Spacer().frame(height: 70)
            } /* ScrollView */
            
            VStack {
                floatingActionButton
                    .buttonStyle(FABStyle())
                    .padding(.horizontal)
        
                Spacer().frame(height: 70)
            } /* VStack */
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
    
    var floatingActionButton: some View {
        Button(action: {
            jobListVM.intent = .create
        }, label: {
            Image(systemName: "plus.circle.fill")
                .resizable()
                .foregroundColor(Color(#colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)))
                .frame(width: 56, height: 56)
                .shadow(color: Color.shadow, radius: 5, x: 5, y: 5)
        })
    }
}

struct ActiveApplicationsView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            JobApplicationsView()
        }
        .background(Color.background.ignoresSafeArea())
        .previewDevice("iPhone 11 Pro")
    }
}


struct ModalView: View {
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        Button("Dismiss") {
            presentationMode.wrappedValue.dismiss()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.red)
        .foregroundColor(Color.white)
        .edgesIgnoringSafeArea(.all)
    }
}
