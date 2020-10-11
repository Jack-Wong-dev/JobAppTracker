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
    var appliedDate: Date
    var status: ApplicationStatus
    var remote: Bool
    var url: String
    var salary: String
    var notes: String
}


#if DEBUG
let jobData = [
    Job(title: "iOS Developer", companyName: "Spotify", location: "New York", appliedDate: Date(), status: .applied, remote: false, url: "https://spotify.com", salary: "110k", notes: "No reply in 2 months means not interested"),
    Job(title: "Android Developer", companyName: "Spotify", location: "New York", appliedDate: Date(), status: .applied, remote: false, url: "https://spotify.com", salary: "110k", notes: "No reply in 2 months means not interested"),
    Job(title: "iOS Developer", companyName: "Spotify", location: "New York", appliedDate: Date(), status: .applied, remote: true, url: "https://spotify.com", salary: "110k", notes: "No reply in 2 months means not interested"),
    Job(title: "iOS Developer", companyName: "Spotify", location: "New York", appliedDate: Date(), status: .applied, remote: true, url: "https://spotify.com", salary: "", notes: "No reply in 2 months means not interested"),
    Job(title: "iOS Developer", companyName: "Spotify", location: "New York", appliedDate: Date(), status: .applied, remote: false, url: "https://spotify.com", salary: "", notes: "No reply in 2 months means not interested"),
    Job(title: "iOS Developer", companyName: "Spotify", location: "New York", appliedDate: Date(), status: .applied, remote: true, url: "https://spotify.com", salary: "110k", notes: ""),
    Job(title: "iOS Developer", companyName: "Spotify", location: "New York", appliedDate: Date(), status: .applied, remote: true, url: "https://spotify.com", salary: "", notes: "No reply in 2 months means not interested"),
    Job(title: "iOS Developer", companyName: "Spotify", location: "New York", appliedDate: Date(), status: .applied, remote: false, url: "https://spotify.com", salary: "110k", notes: "No reply in 2 months means not interested"),
    Job(title: "iOS Developer", companyName: "Spotify", location: "New York", appliedDate: Date(), status: .applied, remote: false, url: "https://spotify.com", salary: "110k", notes: "No reply in 2 months means not interested")
]
#endif

