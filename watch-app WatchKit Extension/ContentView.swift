//
//  ContentView.swift
//  watch-app WatchKit Extension
//
//  Created by Ivo Silva on 28.03.22.
//

import Firebase
import SwiftUI

struct ContentView: View {
    
    @State
    var userID: String?
    
    var body: some View {
        
        Group {
            
            if let userID = userID {
                
                Text(userID)
            } else {
                
                Text("no user")
            }
        }.onAppear {
            do {
                let user = try Auth.auth().getStoredUser(forAccessGroup: "W5C78UTTL2.so.amie.apple-watch-test")
                userID = user.uid
            } catch {
                print("failed getting stored user with error \(error)")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
