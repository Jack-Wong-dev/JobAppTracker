//
//  Router.swift
//  JobAppTracker
//
//  Created by Jack Wong on 2/11/21.
//

import SwiftUI
import Combine

final class Router: ObservableObject {
    @Published var currentScreen: Screen = .home
    @Published var showNavigation = true
}

enum Screen: String, Hashable {
    case home = "Home"
    case search = "Search"
    case favorite = "Favorite"
    case profile = "Profile"
}
