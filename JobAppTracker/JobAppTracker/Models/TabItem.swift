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
    
    init(imageName: String, offset: CGFloat) {
        self.imageName = imageName
        self.offset = offset
    }
    init(imageName: String) {
        self.imageName = imageName
    }
}
