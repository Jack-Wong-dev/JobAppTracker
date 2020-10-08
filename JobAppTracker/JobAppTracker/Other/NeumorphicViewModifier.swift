//
//  NeumorphicViewModifier.swift
//  JobAppTracker
//
//  Created by Jack Wong on 10/6/20.
//

import SwiftUI

struct NeumorphicGreedy: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(
                ZStack {
                    Color.shadow
                    
                    RoundedRectangle(cornerRadius: 16, style: .continuous)
                        .foregroundColor(Color.lighting)
                        .blur(radius: 4)
                        .offset(x: -8, y: -8)
                    
                    RoundedRectangle(cornerRadius: 16, style: .continuous)
                        .fill(
                            LinearGradient(gradient: Gradient(colors: [Color.gradientStart, Color.gradientEnd]), startPoint: .topLeading, endPoint: .bottomTrailing)
                        )
                        .padding(2)
                        .blur(radius: 2)
                }
            )
            .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
            .shadow(color: Color.shadow, radius: 15, x: 15, y: 15)  //Bottom trailing shadow.
            .shadow(color: Color.lighting, radius: 15, x: -15, y: -15) //Top leading shadow.
        
    }
}


struct Neumorphic: ViewModifier {
    func body(content: Content) -> some View {
        content
            .background(
                ZStack {
                    Color.shadow
                    
                    Circle()
                        .foregroundColor(Color.lighting)
                        .blur(radius: 4)
                        .offset(x: -8, y: -8)
                    
                    Circle()
                        .fill(
                            LinearGradient(gradient: Gradient(colors: [Color.gradientStart, Color.lighting]), startPoint: .topLeading, endPoint: .bottomTrailing)
                        )
                        .padding(2)
                        .blur(radius: 2)
                }
            )
            .clipShape(Circle())
            .shadow(color: Color.shadow, radius: 20, x: 20, y: 20)
            .shadow(color: Color.lighting, radius: 20, x: -20, y: -20)
        
    }
}


