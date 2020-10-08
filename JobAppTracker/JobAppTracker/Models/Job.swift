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
    var url = ""
    var appliedDate: Date
    var status: String
    var remote = false
    var salary = ""
    var notes = ""
}


class JobViewModel: ObservableObject {
    
    
    init() {
        
    }
}

#if DEBUG
let jobData = [
    Job(title: "iOS Engineer", companyName: "Snap", location: "New York", appliedDate: Date(), status: "Applied"),
    Job(title: "iOS Engineer", companyName: "Snap", location: "New York", appliedDate: Date(), status: "Applied"),
    Job(title: "iOS Engineer", companyName: "Snap", location: "New York", appliedDate: Date(), status: "Applied"),
    Job(title: "iOS Engineer", companyName: "Snap", location: "New York", appliedDate: Date(), status: "Applied"),
    Job(title: "iOS Engineer", companyName: "Snap", location: "New York", appliedDate: Date(), status: "Applied"),
    Job(title: "iOS Engineer", companyName: "Snap", location: "New York", appliedDate: Date(), status: "Applied"),
]
#endif

