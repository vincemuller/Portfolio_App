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
        ZStack {
            Color.offWhite
                .ignoresSafeArea(.all)
            VStack {
                HStack (spacing: 15) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 25)
                            .fill(.clear)
                            .stroke(.black, style: .init(lineWidth: 2))
                            .frame(width: 170, height: 150)
                        
                    }
                    PA_BackgroundRectangleView(cornerRadius: 30, width: 170, height: 150)
                }
            }
        }
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
