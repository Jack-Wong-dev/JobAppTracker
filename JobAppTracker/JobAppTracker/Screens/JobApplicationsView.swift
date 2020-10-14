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
    @State var yes = true
    
    
    var body: some View {
        
        ZStack(alignment: .bottomTrailing) {
            ScrollView(showsIndicators: false) {
                LazyVGrid(columns: columns, spacing: 40) {
                    ForEach(jobListVM.jobsList) { job in
                        if job.id != jobListVM.selectedJob?.id {
                            JobCard(job: job)
                                .matchedGeometryEffect(id: job.id, in: namespace)
                                .frame(height: 200)
                                .onTapGesture() {
                                    jobListVM.selectedJob = job
                                }
                        } else {
                            Color.clear
                                .frame(height: 200)
                        }
                    }
                }
                .padding()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                
                Spacer().frame(height: 70)
            }
            
            VStack {
                floatingActionButton
                    .buttonStyle(FABStyle())
                    .padding(.horizontal)
        
                Spacer().frame(height: 70)
            }
        }
        .overlay(
            Group {
                if let jobToShow = jobListVM.selectedJob {
                    DetailScreen(job: jobToShow, jobListVM: jobListVM, namespace: namespace)
                        .animation(.easeOut)
                }
            }
        )
        .fullScreenCover(item: $jobListVM.intent) { intent in
            //            switch intent {
            //            case .create:
            //
            //                AddJobAppScreen(jobListVM: jobListVM)
            //            case .update:
            //                if let selectedJob = jobListVM.selectedJob {
            //                    UpdateView(jobListVM: jobListVM, job: selectedJob)
            //                }
            //            }
            
            if intent == .create {
                AddJobAppScreen(jobListVM: jobListVM)
            }
        }
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
