//
//  SessionManager.swift
//  Portfolio_LogInPage
//
//  Created by Vince Muller on 7/18/24.
//

import Amplify
import SwiftUI

enum AuthState {
    case signUp
    case login
    case confirmCode(username: String)
    case session(user: AuthUser)
}

final class SessionManager: ObservableObject {
    @Published var authState: AuthState = .login
    
    func getCurrentUser() {
        if let user = Amplify.Auth.getCurrentUser() {
            authState = .session(user: user)
        } else {
            authState = .login
        }
    }
    
    func showSignUp() {
        authState = .signUp
    }
    
    func showLogin() {
        authState = .login
    }
    
    func showDashboard(user: AuthUser) {
        authState = .session(user: user)
    }
    
    func signUp(username: String, email: String, password: String) {
        let attributes = [AuthUserAttribute(.email, value: email)]
        let options = AuthSignUpRequest.Options(userAttributes: attributes)
        
        _ = Amplify.Auth.signUp(username: username, password: password, options: options) {
            [weak self] result in
            
            switch result {
                
            case .success(let signUpResult):
                print("Sign Up Success", signUpResult)
                
                switch signUpResult.nextStep {
                case .done:
                    print("Finished Sign Up")
                    
                case .confirmUser(let details, _):
                    print(details ?? "no details")
                    
                    DispatchQueue.main.async {
                        self?.authState = .confirmCode(username: username)
                    }
                }
                
            case .failure(let error):
                print("Sign Up Error")
            }
        }
    }
    
    func confirm(username: String, code: String) {
        _ = Amplify.Auth.confirmSignUp(for: username, confirmationCode: code) {
            [weak self] result in
            
            switch result {
            case .success(let confirmResult):
                print(confirmResult)
                if confirmResult.isSignupComplete {
                    DispatchQueue.main.async {
                        self?.showLogin()
                    }
                }
            case .failure(let error):
                print("failed to confirm code: ", error)
            }
        }
    }
    
    func signIn(username: String, password: String) {
        _ = Amplify.Auth.signIn(username: username, password: password) {
            [weak self] result in
            
            switch result {
            case .success(let confirmSignIn):
                print("Logged In Successfully!")
                if confirmSignIn.isSignedIn {
                    DispatchQueue.main.async {
                        self?.getCurrentUser()
                    }
                }
            case .failure(let error):
                print("Failed to log in", error)
            }
        }
    }
    
}
