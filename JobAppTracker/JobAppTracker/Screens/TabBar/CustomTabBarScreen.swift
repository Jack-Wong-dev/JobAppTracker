//
//  CustomTabBarScreen.swift
//  JobAppTracker
//
//  Created by Jack Wong on 2/11/21.
//

import SwiftUI

struct CustomTabBarScreen: View {
    @StateObject var router: Router
    
    var body: some View {
        ZStack {
            VStack {
                CurrentScreen()
                
                if router.showTabBar { CustomTabBar() }
            }
            .environmentObject(router)
        }
    }
}

struct CurrentScreen: View {
    @EnvironmentObject var router: Router
    
    var body: some View {
        VStack {
            Spacer(minLength: 0)
            
            switch router.currentScreen {
            case .home:
                ApplicationsScreen()
            case .search:
                SearchScreen()
            case .favorite:
                Text("favorites").frame(maxWidth: .infinity, maxHeight: .infinity)
            case .profile:
                Text("profile").frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            
            Spacer(minLength: 0)
        }
    }
}

