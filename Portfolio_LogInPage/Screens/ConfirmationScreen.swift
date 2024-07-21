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
    @State var username: String
    @State var code: String = ""
    
    var body: some View {
        ZStack {
            Color(.offWhite)
                .ignoresSafeArea(.all)
            ZStack {
                PA_BackgroundRectangleView(cornerRadius: 20, width: 360, height: 300)
                    .offset(y: 20)
                PA_TitleView(title: "Almost There!", subtitle: "Lets confirm your account")
                    .offset(y: -250)
                VStack (spacing: 5) {
                    PA_TextFieldView(icon: "person.fill", placeholder: "Username", text: username)
                    PA_TextFieldView(icon: "person.crop.circle.fill.badge.checkmark", placeholder: "Confirmation Code", text: code, padding: 25)
                    Button(action: {sessionManager.confirm(username: username, code: code)}, label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 15)
                                .fill(.black)
                                .frame(width: 300, height: 50)
                            Text("Confirm")
                                .foregroundStyle(.white)
                                .font(.title2)
                        }
                    }).offset(y: 50)
                }
            }
        }
    }
}

#Preview {
    ConfirmationScreen(username: "dummy")
}
