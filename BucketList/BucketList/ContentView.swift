//
//  ContentView.swift
//  BucketList
//
//  Created by Galih Samudra on 20/09/24.
//
import LocalAuthentication
import SwiftUI

struct ContentView: View {
    @State private var isUnlocked = false
    
    var body: some View {
        VStack {
            if isUnlocked {
                Text("Unlocked")
            } else {
                Text("Locked")
            }
        }
        .onAppear(perform: {
            authenticate()
        })
        
    }
    
    func authenticate() {
        let context = LAContext()
        var error: NSError?
        
        /// check is biometric authentication possible
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            
            /// exist biometrics
            let reason = "We need to unlock your data."
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { isSuccess, authError in
                
                /// completed authentication
                if isSuccess {
                    print("success")
                    isUnlocked = true
                } else {
                    print("error -- \(authError?.localizedDescription)")
                    isUnlocked = false
                }
            }
        } else {
            /// no biometrics
            print("error -- no biometrics")
        }
    }
}

#Preview {
    ContentView()
}
