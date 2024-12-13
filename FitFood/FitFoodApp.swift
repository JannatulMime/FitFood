//
//  FitFoodApp.swift
//  FitFood
//
//  Created by Habibur Rahman on 27/11/24.
//

import SwiftUI
import FitFoodCore
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
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
 
    
    var body: some Scene {
        WindowGroup {
           
            HomeView(userName: "Pappu", recipes: [dummyRecipe1, dummyRecipe2, dummyRecipe4, dummyRecipe5, dummyRecipe6])

        }
    }
}
