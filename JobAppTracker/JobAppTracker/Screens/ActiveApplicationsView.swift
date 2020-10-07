//
//  ActiveApplicationsView.swift
//  JobAppTracker
//
//  Created by Jack Wong on 10/6/20.
//

import SwiftUI

struct ActiveApplicationsView: View {
    
    @ObservedObject var jobListVM = JobListViewModel()
    @State private var showSheet = false
    
    @State private var columns = [GridItem(.adaptive(minimum: 300), spacing: 16)]
    
    var body: some View {
        
        ZStack(alignment: .bottomTrailing) {
            ScrollView(showsIndicators: false) {
                LazyVGrid(columns: columns, spacing: 16) {
                    ForEach(jobListVM.jobsList) { job in
                        JobCard(job: job)
                            .frame(height: 300)
                            .onTapGesture() {
                                jobListVM.selectedJob = job
                            }
                    }
                }
                .padding()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                
                Spacer().frame(height: 70)
            }
            .sheet(isPresented: $showSheet, content: {
                AddJobAppScreen(jobListVM: jobListVM, showSheet: $showSheet)
            })
            
            VStack {
                Button(action: {
                    showSheet = true
                }, label: {
                    Image(systemName: "plus.circle.fill")
                        .resizable()
                        .foregroundColor(Color(#colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)))
                        .frame(width: 56, height: 56)
                        .padding(.horizontal)
                })
                Spacer().frame(height: 70)
            }
            
            if let jobToShow = jobListVM.selectedJob {
                DetailScreen(job: jobToShow, jobListVM: jobListVM)
            }
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
