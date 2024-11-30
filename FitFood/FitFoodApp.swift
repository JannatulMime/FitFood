//
//  FitFoodApp.swift
//  FitFood
//
//  Created by Habibur Rahman on 27/11/24.
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
struct FitFoodApp: App {
    var body: some Scene {
        WindowGroup {
            DetailsRecipeView()
        }
    }
}
