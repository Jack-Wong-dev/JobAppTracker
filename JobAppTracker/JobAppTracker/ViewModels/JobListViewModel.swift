//
//  JobListViewModel.swift
//  JobAppTracker
//
//  Created by Jack Wong on 10/6/20.
//

import SwiftUI
import Combine

class JobListViewModel: ObservableObject {
    
    @Published var jobRepository = JobRepository()
    @Published var jobsList = [Job]()
    @Published var selectedJob: Job? = nil
    
    private var cancellables = Set<AnyCancellable>()
//    @Published var job =
    
    init() {
        jobRepository.$jobs
            .assign(to: \.jobsList, on: self)
            .store(in: &cancellables)
    }
    
    func addJob(job: Job) {
        jobRepository.addJob(job)
    }
    
    func deleteJob(job: Job) {
        jobRepository.deleteJob(job)
    }
}

