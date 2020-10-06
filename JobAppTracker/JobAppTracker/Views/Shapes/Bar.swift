//
//  Bar.swift
//  JobAppTracker
//
//  Created by Jack Wong on 10/6/20.
//

import SwiftUI

struct Bar: Shape {
    @ObservedObject var tabItems: TabItems
    var tab: CGFloat
    let firstCenter: CGFloat
    let stepperToNextCenter: CGFloat
    
    init(tabItems: TabItems, firstCenter: CGFloat, stepperToNextCenter: CGFloat) {
        self.tabItems = tabItems
        self.tab = tabItems.selectedTabIndex
        self.firstCenter = firstCenter
        self.stepperToNextCenter = stepperToNextCenter
    }
    
    var animatableData: Double {
        get { return Double(tab) }
        set { tab = CGFloat(newValue) }
    }
    
    func path(in rect: CGRect) -> Path {
        let tabCenter = firstCenter + stepperToNextCenter * (tab - 1)
        return Path { p in
            p.move(to: CGPoint(x: rect.minX, y: rect.minY))
            p.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
            p.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
            p.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
            p.addLine(to: CGPoint(x: tabCenter + 50, y: rect.minY))
            p.addCurve(to: CGPoint(x: tabCenter, y: rect.midY),
                       control1: CGPoint(x: tabCenter + 20, y: rect.minY),
                       control2: CGPoint(x: tabCenter + 20, y: rect.minY + 25))
            p.addCurve(to: CGPoint(x: tabCenter - 50, y: rect.minY),
                       control1: CGPoint(x: tabCenter - 20, y: rect.minY + 25),
                       control2: CGPoint(x: tabCenter - 20, y: rect.minY))
            p.addLine(to: CGPoint(x: rect.maxX - tabCenter, y: rect.minY))
        }
    }
}
