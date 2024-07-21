//
//  LogInScreen.swift
//  Portfolio_LogInPage
//
//  Created by Vince Muller on 7/12/24.
//

import SwiftUI
import Amplify

struct LogInScreen: View {
    @EnvironmentObject var sessionManager: SessionManager
    @State private var username: String = ""
    @State private var password: String = ""
    
    var body: some View {
        ZStack {
            Color(.offWhite)
                .ignoresSafeArea(.all)
            ZStack {
                PA_BackgroundRectangleView(cornerRadius: 20, width: 360, height: 300)
                    .offset(y: 20)
                PA_TitleView(title: "Vince Muller", subtitle: "iOS Development Portfolio")
                    .offset(y: -250)
                VStack (spacing: 5) {
                    PA_TextFieldView(icon: "person.fill", placeholder: "Username", text: username, padding: 0)
                    PA_TextFieldView(icon: "lock.fill", placeholder: "Password", text: username, padding: 25)
                    PA_CTAButtonView(action: {sessionManager.signIn(username: username, password: password)}, label: "Log In").offset(y: 50)
                    PA_SecondaryCTAButtonView(action: {sessionManager.resetPassword(username: username)}, label: "Forgot Password?")
                        .offset(y: 60)
                }
            }
            HStack (alignment: .bottom, spacing: 20) {
                Image("appleLogo")
                    .resizable()
                    .frame(width: 40, height: 40)
                    .offset(y: 2)
                Image("googleLogo")
                    .resizable()
                    .frame(width: 30, height: 30)
            }.offset(y: 300)
            PA_SecondaryCTAButtonView(action: {sessionManager.showSignUp()}, label: "Don't have an account? Click Here")
                .frame(height: 780, alignment: .bottom)
        }
    }
}


#Preview {
    LogInScreen()
}
