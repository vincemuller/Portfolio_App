//
//  Portfolio_LogInPageApp.swift
//  Portfolio_LogInPage
//
//  Created by Vince Muller on 7/12/24.
//
import Amplify
import AmplifyPlugins
import SwiftUI

@main
struct Portfolio_LogInPageApp: App {
    
    @ObservedObject var sessionManager = SessionManager()
    
    init() {
        configureAmplify()
    }
    
    var body: some Scene {
        WindowGroup {
            switch sessionManager.authState {
            case .signUp:
                SignUpScreen()
                    .environmentObject(sessionManager)
            case .login:
                LogInScreen()
                    .environmentObject(sessionManager)
            case .confirmCode(let username):
                ConfirmationScreen(username: username)
                    .environmentObject(sessionManager)
            case .session(let user):
                SessionScreen(user: user)
                    .environmentObject(sessionManager)
            }
        }
    }
    
    private func configureAmplify() {
        do {
            try Amplify.add(plugin: AWSCognitoAuthPlugin())
            try Amplify.configure()
            print("Successfully configured Amplify!")
        } catch {
            print("Failed to configure Amplify", error)
        }
    }
    
}
