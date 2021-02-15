//
//  SwiftUIView.swift
//  JobAppTracker
//
//  Created by Jack Wong on 2/11/21.
//

import SwiftUI

struct CustomTabBar: View {
    @EnvironmentObject var router: Router
    @EnvironmentObject var tabBarVM: TabBarViewModel

    var body: some View {
        ZStack {
            HStack {
                TabBarButton(screen: .home)
                
                TabBarButton(screen: .search)
                
                RaisedAddButton()
                
                TabBarButton(screen: .favorite)
                
                TabBarButton(screen: .profile)
            }
            .frame(maxWidth: .infinity)
            .background(Color.systemBackground.ignoresSafeArea(edges: [.horizontal, .bottom]))
            
            if tabBarVM.showMenu {
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
