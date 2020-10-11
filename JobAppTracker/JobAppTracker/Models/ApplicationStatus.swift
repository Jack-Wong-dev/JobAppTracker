//
//  ApplicationStatus.swift
//  JobAppTracker
//
//  Created by Jack Wong on 10/11/20.
//

import Foundation

enum ApplicationStatus: String, Identifiable, CaseIterable {
    var id: String { self.rawValue }
    case watching
    case applied
    case interviewing
    case rejected
    case offered
}
