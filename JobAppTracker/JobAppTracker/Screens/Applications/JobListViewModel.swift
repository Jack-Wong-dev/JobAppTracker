//
//  JobListViewModel.swift
//  JobAppTracker
//
//  Created by Jack Wong on 10/6/20.
//

import SwiftUI
import Combine

enum UserIntent: Int, Identifiable {
    var id: Int { self.rawValue }
    case create
    case update
}

class JobListViewModel: ObservableObject {
    
//    @Published var jobRepository = JobRepository()
    @Published var jobsList = [Job]()
    @Published var selectedJob: Job? = nil
    @Published var intent: UserIntent? = nil
    
    @Published var lastSelectedJob: Job?
    
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        JobRepository.shared.$jobs
            .assign(to: \.jobsList, on: self)
            .store(in: &cancellables)
    }
    
//    func addJob(job: Job) {
//        JobRepository.shared.addJob(job)
//    }
    
    func deleteJob(job: Job) {
        JobRepository.shared.deleteJob(job)
    }
    
    func updateJob(job: Job) {
        JobRepository.shared.updateJob(job)
    }
}

