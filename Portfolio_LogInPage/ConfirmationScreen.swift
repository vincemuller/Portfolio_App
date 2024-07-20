//
//  ConfirmationScreen.swift
//  Portfolio_LogInPage
//
//  Created by Vince Muller on 7/18/24.
//

import SwiftUI
import Amplify

struct ConfirmationScreen: View {
    
    @EnvironmentObject var sessionManager: SessionManager
    
    var username: String = ""
    
    var body: some View {
        Text("Hello, Confirmation Screen")
    }
}

#Preview {
    ConfirmationScreen()
}
