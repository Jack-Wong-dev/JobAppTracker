//
//  CustomTabBarScreen.swift
//  JobAppTracker
//
//  Created by Jack Wong on 2/11/21.
//

import SwiftUI

class TabBarViewModel: ObservableObject {
    @Published var showMenu = false
}

struct CustomTabBarScreen: View {
    @EnvironmentObject var router: Router
    @StateObject private var tabBarVM = TabBarViewModel()
    @State private var tabBarHeight: CGFloat?
    
    var body: some View {
        ZStack(alignment: .bottom) {
            VStack {
                CurrentScreen()
                Spacer().frame(height: tabBarHeight)
            
            }
            .blur(radius: tabBarVM.showMenu ? 3.0 : 0)
         
            if tabBarVM.showMenu {
                Color.clear.ignoresSafeArea()
                    .contentShape(Rectangle())
                    .onTapGesture(perform: closeFABMenu)
            }
                        
            if router.showNavigation {
                CustomTabBar()
                    .background(
                        GeometryReader { proxy in
                            Color.clear.preference(
                                key: TabBarPreferenceKey.self,
                                value: proxy.size.height
                            )
                        }
                    )
            }
        }
        .background(Color.background.ignoresSafeArea())
        .onPreferenceChange(TabBarPreferenceKey.self) {
            tabBarHeight = $0
        }
        .environmentObject(router)
        .environmentObject(tabBarVM)
    }
    
    private func closeFABMenu() {
        withAnimation {
            tabBarVM.showMenu = false
        }
    }
}

private extension CustomTabBarScreen {
    struct TabBarPreferenceKey: PreferenceKey {
        static let defaultValue: CGFloat = 0
        
        static func reduce(value: inout CGFloat,
                           nextValue: () -> CGFloat) {
            value = max(value, nextValue())
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

