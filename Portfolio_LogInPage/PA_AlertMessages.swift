//
//  PA_AlertMessages.swift
//  Portfolio_LogInPage
//
//  Created by Vince Muller on 7/22/24.
//

import Foundation

enum PA_Error: String, Error {
    case usernameAlreadyExists = "You have successfully created and added this food to your foods"
}

enum PA_SessionAlert: String, Error {
    case success = "Welcome to Vince Muller's Portfolio App"
}
