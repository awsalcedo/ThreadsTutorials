//
//  ThreadsTutorialsApp.swift
//  ThreadsTutorials
//
//  Created by usradmin on 20/6/24.
//

import SwiftUI
// se agrega para configurar Firebase
import FirebaseCore

/*
 Se añade todo el AppDelegate
 */
class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()

    return true
  }
}

@main
struct ThreadsTutorialsApp: App {
    // Registra el AppDelegate para la configuración de Firebase
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
            LoginView()
        }
    }
}
