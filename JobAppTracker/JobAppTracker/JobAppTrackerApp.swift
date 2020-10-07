//
//  JobAppTrackerApp.swift
//  JobAppTracker
//
//  Created by Jack Wong on 10/6/20.
//

import SwiftUI

@main
struct JobAppTrackerApp: App {
    @UIApplicationDelegateAdaptor(MyAppDelegate.self) var appDelegate
    @Environment(\.scenePhase) var scenePhase
    
    var body: some Scene {
        WindowGroup {
            TabBarView()
        }
    }
}
