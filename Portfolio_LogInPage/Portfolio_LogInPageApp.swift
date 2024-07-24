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
    
    @ObservedObject var sessionViewModel = SessionViewModel()
    @UIApplicationDelegateAdaptor(AppDelegate.self) private var appDelegate
    
    init() {
        configureAmplify()
    }
    
    var body: some Scene {
        
        WindowGroup {
            switch sessionViewModel.authState {
            case .signUp:
                SignUpScreen()
                    .environmentObject(sessionViewModel)
            case .login:
                LogInScreen()
                    .environmentObject(sessionViewModel)
            case .confirmCode(let username):
                ConfirmationScreen(username: username)
                    .environmentObject(sessionViewModel)
            case .resetPassword(let username):
                ResetPasswordScreen(username: username)
                    .environmentObject(sessionViewModel)
            case .session(let user):
                DashboardScreen(user: user)
                    .environmentObject(sessionViewModel)
            }
        }
    }
    
    private func configureAmplify() {
        do {
            try Amplify.add(plugin: AWSCognitoAuthPlugin())
            try Amplify.configure()
            if let currentUser = Amplify.Auth.getCurrentUser() {
                sessionViewModel.signOut()
                print("logged out")
            }
            print("Successfully configured Amplify!")
        } catch {
            print("Failed to configure Amplify", error)
        }
    }
    
}
