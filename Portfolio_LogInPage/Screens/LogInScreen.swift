//
//  LogInScreen.swift
//  Portfolio_LogInPage
//
//  Created by Vince Muller on 7/12/24.
//

import SwiftUI
import Amplify

struct LogInScreen: View {
    @EnvironmentObject var sessionViewModel: SessionViewModel
    
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
                    PA_TextFieldView(icon: "person.fill", placeholder: "Username", text: $sessionViewModel.username, padding: 0)
                    PA_SecureFieldView(icon: "lock.fill", placeholder: "Password", text: $sessionViewModel.password, padding: 25)
                    PA_CTAButtonView(action: {sessionViewModel.signIn(username: sessionViewModel.username, password: sessionViewModel.password)}, label: "Sign In").offset(y: 50)
                    PA_SecondaryCTAButtonView(action: {sessionViewModel.resetPassword(username: sessionViewModel.username)}, label: "Forgot Password?")
                        .offset(y: 60)
                }
            }
            HStack (alignment: .bottom, spacing: 20) {
                Image("appleLogo")
                    .resizable()
                    .frame(width: 40, height: 40)
                    .offset(y: 2)
                    .onTapGesture {
                        sessionViewModel.iconLogInAttempt()
                    }
                Image("googleLogo")
                    .resizable()
                    .frame(width: 30, height: 30)
                    .onTapGesture {
                        sessionViewModel.iconLogInAttempt()
                    }
            }.offset(y: 300)
            PA_SecondaryCTAButtonView(action: {sessionViewModel.showSignUp()}, label: "Don't have an account? Click Here")
                .frame(height: 780, alignment: .bottom)
        }
        .alert(sessionViewModel.errTitle, isPresented: $sessionViewModel.isShowing) {
            Button("Ok") {
                sessionViewModel.isShowing = false
            }
        } message: {
            Text(sessionViewModel.errMessage)
        }
    }
}


//#Preview {
//    LogInScreen(sessionViewModel: SessionViewModel())
//}
