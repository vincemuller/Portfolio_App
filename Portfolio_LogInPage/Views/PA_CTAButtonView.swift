//
//  PA_CTAButton.swift
//  Portfolio_LogInPage
//
//  Created by Vince Muller on 7/21/24.
//

import SwiftUI

struct PA_CTAButtonView: View {
    var action: () -> () = {print("function to execute")}
    var label: String = ""
    
    var body: some View {
        Button(action: action, label: {
            ZStack {
                RoundedRectangle(cornerRadius: 15)
                    .fill(.black)
                    .frame(width: 300, height: 50)
                Text(label)
                    .foregroundStyle(.white)
                    .font(.title2)
            }
        })
    }
}

#Preview {
    PA_CTAButtonView()
}
