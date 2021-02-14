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
    
    @StateObject private var router = Router()
    @StateObject private var jobRepository = JobRepository.shared
    
    var body: some Scene {
        WindowGroup {
            CustomTabBarScreen()
                .environmentObject(router)
                .environmentObject(jobRepository)
        }
    }
}
