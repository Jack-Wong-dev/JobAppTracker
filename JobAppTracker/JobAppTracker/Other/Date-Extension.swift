//
//  Date-Extension.swift
//  JobAppTracker
//
//  Created by Jack Wong on 10/7/20.
//

import Foundation

extension Date {
    
    func toString(_ style: DateFormatter.Style) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = style
        return formatter.string(from: self)
    }
}
