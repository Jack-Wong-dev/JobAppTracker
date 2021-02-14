//
//  TabBarIcon.swift
//  JobAppTracker
//
//  Created by Jack Wong on 2/11/21.
//

import SwiftUI

struct TabBarButton: View {
    @EnvironmentObject var router: Router
    @ScaledMetric(relativeTo: .body) var imageSize: CGFloat = 22
    
    let screen: Screen
    
    var isCurrentScreen: Bool { router.currentScreen == screen }
    
    var body: some View {
        Button(action: onTap) {
            VStack {
                Image.getTabIcon(for: screen)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: imageSize, height: imageSize)
                
                Text(screen.rawValue)
                    .font(.footnote)
            }
            .foregroundColor(Color(isCurrentScreen ? .systemPurple : .systemGray))
            .padding(.top, 10)
        }
        .frame(maxWidth: .infinity)
    }
    
    private func onTap() { router.currentScreen = screen }
}
