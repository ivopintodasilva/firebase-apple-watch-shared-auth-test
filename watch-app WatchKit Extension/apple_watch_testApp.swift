//
//  apple_watch_testApp.swift
//  watch-app WatchKit Extension
//
//  Created by Ivo Silva on 28.03.22.
//

import Firebase
import SwiftUI

@main
struct apple_watch_testApp: App {
    
    init() {
        
        FirebaseApp.configure()
        
        Auth.auth().shareAuthStateAcrossDevices = true
        do { try Auth.auth().useUserAccessGroup("W5C78UTTL2.so.amie.apple-watch-test") }
        catch { print("useUserAccessGroup failed with error \(error)") }
    }
    
    @SceneBuilder var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
            }
        }

        WKNotificationScene(controller: NotificationController.self, category: "myCategory")
    }
}
