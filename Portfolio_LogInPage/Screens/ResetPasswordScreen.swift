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
                PA_BackgroundRectangleView(cornerRadius: 20, width: 360, height: 320)
                    .offset(y: 20)
                PA_TitleView(title: "Reset Password", subtitle: "Ok, set a new password that you'll\nprobably forget 😉")
                    .offset(y: -250)
                VStack (spacing: 5) {
                    PA_TextFieldView(icon: "checkmark.seal.fill", placeholder: "Confirmation Code", text: code, padding: 0, fontSize: 16)
                    PA_TextFieldView(icon: "lock", placeholder: "New Password", text: password, padding: 25)
                    PA_TextFieldView(icon: "lock.fill", placeholder: "Confirm New Password", text: passwordConfirmation, padding: 25)
                    PA_CTAButtonView(action: {
                        guard password == passwordConfirmation else {
                            print("Password needs to be confirmed prior to resetting!")
                            return
                        }
                        sessionManager.changePassword(username: username, newPassword: password, code: code)}, label: "Set New Password")
                    .offset(y: 40)
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
