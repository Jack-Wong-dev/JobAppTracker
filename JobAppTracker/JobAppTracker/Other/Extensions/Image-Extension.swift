//
//  Image-extension.swift
//  JobAppTracker
//
//  Created by Jack Wong on 2/11/21.
//

import SwiftUI

extension Image {
    static let house = Image(systemName: "house")
    static let magnifyingglass = Image(systemName: "magnifyingglass")
    static let plusCircleFill = Image(systemName: "plus.circle.fill")
    static let heart = Image(systemName: "heart")
    static let personCropCircle = Image(systemName: "person.crop.circle")
    
    static func getTabIcon(for screen: Screen) -> Image {
        switch screen {
        case .home:
            return Image.house
        case .search:
            return Image.magnifyingglass
        case .favorite:
            return Image.heart
        case .profile:
            return Image.personCropCircle
        }
    }
}
