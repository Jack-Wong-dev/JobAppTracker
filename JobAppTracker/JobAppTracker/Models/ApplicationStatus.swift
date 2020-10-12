//
//  ApplicationStatus.swift
//  JobAppTracker
//
//  Created by Jack Wong on 10/11/20.
//

import UIKit

enum ApplicationStatus: String, Codable, Identifiable, CaseIterable {
    var id: String { self.rawValue }
    
    case watching = "watching"
    case applied = "applied"
    case interviewing = "interviewing"
    case rejected = "rejected"
    case offered = "offered"
    
    var color: UIColor {
        switch self {
        case .watching:
            return .systemOrange
        case .applied:
            return .systemTeal
        case .interviewing:
            return .systemPurple
        case .rejected:
            return .systemRed
        case .offered:
            return .systemGreen
        }
    }
}
