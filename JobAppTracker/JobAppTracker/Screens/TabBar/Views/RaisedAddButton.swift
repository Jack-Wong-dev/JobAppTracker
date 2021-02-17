//
//  RaisedAddButton.swift
//  JobAppTracker
//
//  Created by Jack Wong on 2/11/21.
//

import SwiftUI

struct RaisedAddButton: View {
    @EnvironmentObject var router: Router
    @ScaledMetric(relativeTo: .body) var imageSize: CGFloat = 48
    @State private var rise = false
    
    var body: some View {
        Button(action: toggleMenu) {
            Image(systemName: "plus.circle.fill")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .foregroundColor(Color(#colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)))
                .frame(width: imageSize, height: imageSize)
                .rotationEffect(Angle(degrees: router.showMenu ? 90 : 0))
                .shadow(color: Color.shadow, radius: 5, x: 5, y: 5)
                .offset(y: rise ? -imageSize/2 : 0)
        }
        .onAppear(perform: onAppear)
    }
    
    private func toggleMenu() {
        withAnimation {
            router.showMenu.toggle()
        }
    }
    
    private func onAppear() {
        withAnimation(Animation.easeOut.delay(0.1)) {
            rise = true
        }
    }
}
