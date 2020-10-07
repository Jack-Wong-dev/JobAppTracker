//
//  TabBarItems.swift
//  JobAppTracker
//
//  Created by Jack Wong on 10/6/20.
//

import SwiftUI

class TabItems: ObservableObject {
    
    @Published var items: [TabItem] = [
        TabItem(imageName: "house.fill", offset: -20, color: .systemGreen),
        TabItem(imageName: "magnifyingglass", color: .systemPink),
        TabItem(imageName: "plus.app.fill", color: .systemBlue),
        TabItem(imageName: "heart.fill", color: .systemRed),
        TabItem(imageName: "person.fill", color: .systemTeal),
    ]
    
    @Published var selectedTabIndex: CGFloat = 1
    
    func select(_ index: Int) {
        let tabItem = items[index]
        
        tabItem.offset = 15
        
        withAnimation(Animation.easeInOut) {
            selectedTabIndex = CGFloat(index + 1)
            for i in 0..<items.count {
                if i != index {
                    items[i].offset = -5
                }
            }
        }
        withAnimation(Animation.easeOut(duration: 0.25).delay(0.25)) {
            tabItem.offset = -25
        }
    }
}
