//
//  Job.swift
//  JobAppTracker
//
//  Created by Jack Wong on 10/6/20.
//

import Foundation

struct Job: Codable, Identifiable {
//    @DocumentID var id: String?
//    @ServerTimestamp var createdTime: Timestamp?
    var id = UUID()
    var title: String
    var companyName: String
    var location: String
    var appliedDate: String
    var status: String
}
