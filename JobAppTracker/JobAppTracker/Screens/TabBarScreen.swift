//
//  TabBarView.swift
//  JobAppTracker
//
//  Created by Jack Wong on 10/6/20.
//

import SwiftUI

struct TabBarScreen: View {
    @StateObject var tabItems = TabItems()
    var body: some View {
        ZStack(alignment: .bottom) {
            
            currentScreen
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            TabBar(tabItems: tabItems)
        }
        .background(Color.background.ignoresSafeArea())
    }
    
    @ViewBuilder
    var currentScreen: some View {
        switch tabItems.selectedTabIndex {
        case 1:
            ApplicationsScreen()
        case 2:
            SearchScreen()
        case 3:
            Text("Add")
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color.background)
        case 4:
            Text("Favorite")
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color.background)
        case 5:
            Text("Profile")
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color.background)
        default:
            EmptyView()
        }
    }
}




struct CustomTabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBarScreen()
            .previewDevice("iPhone 11 Pro")
    }
}
