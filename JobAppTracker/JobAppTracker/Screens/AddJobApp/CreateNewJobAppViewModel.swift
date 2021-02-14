//
//  CreateNewJobAppViewModel.swift
//  JobAppTracker
//
//  Created by Jack Wong on 2/11/21.
//

import Foundation
import Combine

class CreateNewJobAppViewModel: ObservableObject {
    @Published var title = ""
    @Published var company = ""
    @Published var location = ""
    @Published var applyDate = Date()
    @Published var remote = false
    @Published var url = ""
    @Published var salary = ""
    @Published var notes = ""
    @Published var status: ApplicationStatus = .watching
    
    func addJob() {
        JobRepository.shared.addJob(
            Job(title: title,
                companyName: company,
                location: location,
                appliedDate: applyDate,
                status: status,
                remote: remote,
                url: url,
                salary: salary,
                notes: notes)
        )
    }
}
