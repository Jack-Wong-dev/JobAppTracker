//
//  NeumorphicCard.swift
//  JobAppTracker
//
//  Created by Jack Wong on 10/18/20.
//

import SwiftUI

struct NeumorphicCard: View {
    var body: some View {
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
        .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
        .shadow(color: Color.shadow, radius: 15, x: 15, y: 15)  //Bottom trailing shadow.
        .shadow(color: Color.lighting, radius: 15, x: -15, y: -15) //Top leading shadow.
    }
}


struct NeumorphicCard_Previews: PreviewProvider {
    static var previews: some View {
        NeumorphicCard()
    }
}
