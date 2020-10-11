//
//  ApplicationStatus.swift
//  JobAppTracker
//
//  Created by Jack Wong on 10/11/20.
//

import Foundation

enum ApplicationStatus: String, Codable, Identifiable, CaseIterable {
    var id: String { self.rawValue }
    case watching = "watching"
    case applied = "applied"
    case interviewing = "interviewing"
    case rejected = "rejected"
    case offered = "offered"
}
