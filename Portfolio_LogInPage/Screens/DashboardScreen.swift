//
//  DashboardScreen.swift
//  Portfolio_LogInPage
//
//  Created by Vince Muller on 7/20/24.
//

import Amplify
import SwiftUI


struct DashboardScreen: View {
    
    @EnvironmentObject var sessionViewModel: SessionViewModel
    
    let user: AuthUser
    
    var body: some View {
        Text("Dashboard Screen \(user.username)")
    }
}


//Preview Objects
struct user: AuthUser {
    var username: String
    var userId: String
}
let u = user(username: "dummy", userId: "1")

#Preview {
    DashboardScreen(user: u)
}
