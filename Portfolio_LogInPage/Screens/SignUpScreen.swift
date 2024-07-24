//
//  SignUpScreen.swift
//  Portfolio_LogInPage
//
//  Created by Vince Muller on 7/18/24.
//

import SwiftUI
import Amplify

struct SignUpScreen: View {
    
    @EnvironmentObject var sessionViewModel: SessionViewModel
    
    @State var username = ""
    @State var email = ""
    @State var password = ""
    @State var confPassword = ""
    
    var body: some View {
        ZStack {
            Color(.offWhite)
                .ignoresSafeArea(.all)
            ZStack {
                PA_BackgroundRectangleView(cornerRadius: 20, width: 360, height: 410)
                    .offset(y: 20)
                PA_TitleView(title: "Welcome!", subtitle: "Lets get a few details")
                    .offset(y: -250)
                VStack (spacing: 5) {
                    PA_TextFieldView(icon: "person.fill", placeholder: "Username", text: $username, padding: 0)
                    PA_TextFieldView(icon: "envelope.fill", placeholder: "Email", text: $email, padding: 25, fontSize: 16)
                    PA_SecureFieldView(icon: "lock", placeholder: "Password", text: $password, padding: 25)
                    PA_SecureFieldView(icon: "lock.fill", placeholder: "Confirm Password", text: $confPassword, padding: 25)
                    PA_CTAButtonView(action: {
                        sessionViewModel.signUp(username: username, email: email, password: password)
                    }, label: "Create Account")
                    .offset(y: 40)
                    PA_SecondaryCTAButtonView(action: {
                        sessionViewModel.showLogin()
                    }, label: "Already have an account?")
                    .offset(y: 50)
                }
                HStack (alignment: .bottom, spacing: 20) {
                    Image("appleLogo")
                        .resizable()
                        .frame(width: 40, height: 40)
                        .offset(y: 2)
                        .onTapGesture {
                        }
                    Image("googleLogo")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .onTapGesture {
                        }
                }.offset(y: 300)
            }
        }
    }
}

#Preview {
    SignUpScreen()
}
