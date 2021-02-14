//
//  SwiftUIView.swift
//  JobAppTracker
//
//  Created by Jack Wong on 2/11/21.
//

import SwiftUI

struct CustomTabBar: View {
    @EnvironmentObject var router: Router
    @State private var showMenu = false

    var body: some View {
        ZStack {
            HStack {
                TabBarButton(screen: .home)
                TabBarButton(screen: .search)
                
                RaisedAddButton(showMenu: $showMenu)
                
                TabBarButton(screen: .favorite)
                TabBarButton(screen: .profile)
            }
            .frame(maxWidth: .infinity)
            .background(Color.systemBackground.ignoresSafeArea(edges: [.horizontal, .bottom]))
            .transition(.move(edge: .bottom))
            
            if showMenu {
                FloatingActionMenu()
            }
        }
    }
}


struct CustomTabBar_Previews: PreviewProvider {
    static var previews: some View {
        CustomTabBar()
    }
}
