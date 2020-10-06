//
//  TabBarView.swift
//  JobAppTracker
//
//  Created by Jack Wong on 10/6/20.
//

import SwiftUI

struct TabBarView: View {
    @StateObject var tabItems = TabItems()
    var body: some View {
        ZStack(alignment: .bottom) {
            
            currentScreen
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            TabBar(tabItems: tabItems)
        }
    }
    
    @ViewBuilder
    var currentScreen: some View {
        switch tabItems.selectedTabIndex {
        case 1:
            ActiveApplicationsView()
        case 2:
            Text("Search All Job Applications")
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color.offWhite)
        case 3:
            Text("Add")
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color.offWhite)
        case 4:
            Text("Favorite")
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color.offWhite)
        case 5:
            Text("Profile")
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color.offWhite)
        default:
            EmptyView()
        }
    }
}




struct CustomTabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
            .previewDevice("iPhone 11 Pro")
    }
}
