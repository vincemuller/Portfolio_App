//
//  SessionScreen.swift
//  Portfolio_LogInPage
//
//  Created by Vince Muller on 7/18/24.
//

import SwiftUI
import Amplify

struct SessionScreen: View {
    
    @EnvironmentObject var sessionManager: SessionManager
    
    let user: AuthUser
    
    var body: some View {
        Text("Hello, Session Screen")
    }
}

//#Preview {
//    struct User: AuthUser {
//        var username: String = "Dummy"
//        var userId: String = "1"
//    }
//    
////    SessionScreen(user: User())
//}
