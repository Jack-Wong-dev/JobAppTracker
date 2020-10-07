//
//  MyAppDelegate.swift
//  JobAppTracker
//
//  Created by Jack Wong on 10/6/20.
//
import UIKit
import Firebase

class MyAppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        Auth.auth().signInAnonymously()
        return true
    }
}
