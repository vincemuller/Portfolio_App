//
//  Portfolio_LogInPageApp.swift
//  Portfolio_LogInPage
//
//  Created by Vince Muller on 7/12/24.
//
import Amplify
import SwiftUI

@main
struct Portfolio_LogInPageApp: App {
    
    init() {
        configureAmplify()
    }
    
    var body: some Scene {
        WindowGroup {
            LogInScreen()
        }
    }
    
    private func configureAmplify() {
        do {
            try Amplify.configure()
            print("Successfully configured Amplify!")
        } catch {
            print("Failed to configure Amplify", error)
        }
    }
}
