//
//  Job.swift
//  JobAppTracker
//
//  Created by Jack Wong on 10/6/20.
//

import Foundation

struct Job: Identifiable {
    let id = UUID()
    let title: String
    let companyName: String
    let location: String
    let appliedDate: String
    let status: String
    
}
