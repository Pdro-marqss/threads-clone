//
//  Threads_CloneApp.swift
//  Threads_Clone
//
//  Created by Pedro Marques on 19/04/24.
//

import SwiftUI
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {
   func application(_ application: UIApplication,
                    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
      FirebaseApp.configure()
      return true
   }
}

@main
struct Threads_CloneApp: App {
   @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
   
   var body: some Scene {
      WindowGroup {
         LoginView()
      }
   }
}
