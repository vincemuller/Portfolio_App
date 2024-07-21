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
                RoundedRectangle(cornerRadius: 20)
                    .fill(.white)
                    .frame(width: 360, height: 300)
                    .offset(y: 20)
                VStack {
                    Text("Vince Muller")
                        .font(.system(size: 25, weight: .semibold, design: .serif))
                    Text("iOS Development Portfolio")
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
                        Image(systemName: "lock.fill")
                            .font(.system(size: 20))
                        TextField("Password", text: $password)
                            .font(.system(size: 20))
                            .offset(y: 3)
                    }
                    .frame(width: 300)
                    .padding(.top, 25)
                    Rectangle()
                        .frame(width: 300, height: 1)
                    Button(action: {sessionManager.signIn(username: username, password: password)}, label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 15)
                                .fill(.black)
                                .frame(width: 300, height: 50)
                            Text("Log In")
                                .foregroundStyle(.white)
                                .font(.title2)
                        }
                    }).offset(y: 50)
                    Button(action: {print("Password Reset!")}, label: {
                        Text("Forgot Password?")
                            .font(.system(size: 14))
                            .foregroundStyle(.black)
                    }).offset(y: 60)
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
            Button(action: {sessionManager.signOut()}, label: {
                Text("Don't have an account? Click Here")
                    .font(.system(size: 14))
                    .foregroundStyle(.black)
            }).frame(height: 780, alignment: .bottom)
        }
    }
}


#Preview {
    LogInScreen()
}
