//
//  ContentView.swift
//  apple-watch-test
//
//  Created by Ivo Silva on 28.03.22.
//

import Firebase
import SwiftUI

struct ContentView: View {
    
    @State
    var userID: String? = Auth.auth().currentUser?.uid
    
    var body: some View {

        if let userID = userID {
            
            VStack {
                Text(userID)
                Button("Log out") {
                    do {
                        try Auth.auth().signOut()
                        self.userID = nil
                    }
                    catch { print("sign out failed with error \(error)") }
                }
            }
        } else {
            
            Button("Log in") {
                Auth.auth().signInAnonymously { result, error in
                    if let result = result { self.userID = result.user.uid }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
