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
                RoundedRectangle(cornerRadius: 20)
                    .fill(.white)
                    .frame(width: 360, height: 300)
                    .offset(y: 20)
                VStack {
                    Text("Almost There!")
                        .font(.system(size: 25, weight: .semibold, design: .serif))
                    Text("Lets confirm your account")
                }.offset(y: -250)
                VStack (spacing: 5) {
                        HStack (alignment: .bottom) {
                            Image(systemName: "person.fill")
                                .font(.system(size: 20))
                            TextField("Username", text: $username)
                                .font(.system(size: 20))
                                .offset(y: 4)
                        }.frame(width: 300)
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
                    Button(action: {sessionManager.showLogin()}, label: {
                        Text("Already have an account?")
                            .font(.system(size: 14))
                            .foregroundStyle(.black)
                    }).offset(y: 60)
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
    ConfirmationScreen(username: "dummy")
}
