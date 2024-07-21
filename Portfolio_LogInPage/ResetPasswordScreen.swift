//
//  ResetPasswordScreen.swift
//  Portfolio_LogInPage
//
//  Created by Vince Muller on 7/21/24.
//

import SwiftUI
import Amplify


struct ResetPasswordScreen: View {
    @EnvironmentObject var sessionManager: SessionManager
    @State var username: String
    @State var code: String = ""
    @State var password: String = ""
    @State var passwordConfirmation: String = ""
    
    var body: some View {
        ZStack {
            Color(.offWhite)
                .ignoresSafeArea(.all)
            ZStack {
                RoundedRectangle(cornerRadius: 20)
                    .fill(.white)
                    .frame(width: 360, height: 300)
                    .offset(y: 20)
                VStack {
                    Text("Reset Password")
                        .font(.system(size: 25, weight: .semibold, design: .serif))
                    Text("Ok, set a new password that you'll\nprobably forget 😉")
                        .multilineTextAlignment(.center)
                }.offset(y: -250)
                VStack (spacing: 5) {
                        HStack (alignment: .bottom) {
                            Image(systemName: "person.fill")
                                .font(.system(size: 20))
                            TextField("New Password", text: $password)
                                .font(.system(size: 20))
                                .offset(y: 4)
                        }.frame(width: 300)
                        Rectangle()
                        .frame(width: 300, height: 1)
                    HStack (alignment: .bottom) {
                        Image(systemName: "person.crop.circle.fill.badge.checkmark")
                            .font(.system(size: 20))
                        TextField("Confirm Password", text: $passwordConfirmation)
                            .font(.system(size: 20))
                            .offset(y: 3)
                    }
                    .frame(width: 300)
                    .padding(.top, 25)
                    Rectangle()
                    .frame(width: 300, height: 1)
                    HStack (alignment: .bottom) {
                        Image(systemName: "person.crop.circle.fill.badge.checkmark")
                            .font(.system(size: 20))
                        TextField("Confirmation Code", text: $code)
                            .font(.system(size: 20))
                            .offset(y: 3)
                    }
                    .frame(width: 300)
                    .padding(.top, 25)
                    Rectangle()
                    .frame(width: 300, height: 1)
                    Button(action: {
                        guard password == passwordConfirmation else {
                            print("Password needs to be confirmed prior to resetting!")
                            return
                        }
                        sessionManager.changePassword(username: username, newPassword: password, code: code)}, label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 15)
                                .fill(.black)
                                .frame(width: 300, height: 50)
                            Text("Set New Password")
                                .foregroundStyle(.white)
                                .font(.title2)
                        }
                    }).offset(y: 50)
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
            }
        }
    }
}

#Preview {
    ResetPasswordScreen(username: "vmuller2529")
}
