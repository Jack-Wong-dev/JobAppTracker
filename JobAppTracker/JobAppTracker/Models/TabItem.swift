//
//  TabItem.swift
//  JobAppTracker
//
//  Created by Jack Wong on 10/6/20.
//

import SwiftUI

class TabItem: Identifiable {
    let id = UUID()
    let imageName: String
    var offset: CGFloat = -5
    var color: UIColor
    
    init(imageName: String, offset: CGFloat, color: UIColor) {
        self.imageName = imageName
        self.offset = offset
        self.color = color
    }
    
    init(imageName: String, color: UIColor) {
        self.imageName = imageName
        self.color = color
    }
}

