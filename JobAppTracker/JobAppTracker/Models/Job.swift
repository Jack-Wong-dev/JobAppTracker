//
//  Job.swift
//  JobAppTracker
//
//  Created by Jack Wong on 10/6/20.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

struct Job: Codable, Identifiable {
    @DocumentID var id: String?
    @ServerTimestamp var createdTime: Timestamp?
    var userId: String?
    var title: String
    var companyName: String
    var location: String
    var appliedDate: String
    var status: String
}

#if DEBUG
//let jobData = [
//    Job(title: "iOS Engineer", companyName: "Snap", location: "New York", appliedDate: "Jun 25, 2020", status: "Applied"),
//    Job(title: "iOS Engineer", companyName: "Snap", location: "New York", appliedDate: "Jun 25, 2020", status: "Applied"),
//    Job(title: "iOS Engineer", companyName: "Snap", location: "New York", appliedDate: "Jun 25, 2020", status: "Applied"),
//    Job(title: "iOS Engineer", companyName: "Snap", location: "New York", appliedDate: "Jun 25, 2020", status: "Applied"),
//    Job(title: "iOS Engineer", companyName: "Snap", location: "New York", appliedDate: "Jun 25, 2020", status: "Applied"),
//    Job(title: "iOS Engineer", companyName: "Snap", location: "New York", appliedDate: "Jun 25, 2020", status: "Applied"),
//]
#endif
