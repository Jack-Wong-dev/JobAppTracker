//
//  FloatingActionMenu.swift
//  JobAppTracker
//
//  Created by Jack Wong on 2/11/21.
//

import SwiftUI
import Combine


struct FloatingActionMenu: View {
    @EnvironmentObject private var router: Router
    @ScaledMetric private var imageSize: CGFloat = 48
    
    var body: some View {
        HStack(spacing: 0) {
            FloatingActionMenuButton(systemName: "doc.circle.fill", option: .newApplication)
            
            Spacer()
                .frame(width: imageSize)
                .layoutPriority(1)
            
            FloatingActionMenuButton(systemName: "star.circle.fill", option: .newSTAR)
        }
        .fullScreenCover(item: $router.selectedOption) { option in
            switch option {
            case .newApplication:
                CreateNewJobAppScreen()
            case .newSTAR:
                CreateNewBehavorialScreen()
            }
        }
        .transition(.scale)
        .offset(y: -imageSize * 2)
    }
}


struct FloatingActionMenuButton: View {
    @EnvironmentObject var router: Router
    @ScaledMetric(relativeTo: .body) private var imageSize: CGFloat = 48

    let systemName: String
    let option: FloatingMenuAction
        
    var body: some View {
        Button(action: action) {
            Image(systemName: systemName)
                .resizable()
                .aspectRatio(contentMode: .fit)
//                .foregroundColor(.white)
                .foregroundColor(Color(#colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)))
                .frame(width: imageSize, height: imageSize)
                .background(Circle().fill(Color.systemBackground))
                .shadow(color: Color.shadow, radius: 5, x: 5, y: 5)
        }
    }
    
    private func action() {
        print("full screen for \(option.rawValue)")
        router.selectedOption = option
    }
}

enum FloatingMenuAction: Int, Identifiable {
    var id: Int { self.rawValue }
    
    case newApplication
    case newSTAR
}
