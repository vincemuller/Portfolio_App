//
//  PA_SecureFieldView.swift
//  Portfolio_LogInPage
//
//  Created by Vince Muller on 7/24/24.
//

import SwiftUI

struct PA_SecureFieldView: View {
    var icon: String = ""
    var placeholder: String = ""
    @Binding var text: String
    var padding: CGFloat = 0
    var fontSize: CGFloat = 20
    
    var body: some View {
        HStack (alignment: .bottom) {
            Image(systemName: icon)
                .font(.system(size: fontSize))
                .foregroundStyle(.black)
            SecureField(placeholder, text: $text)
                .font(.system(size: 20))
                .foregroundStyle(.black)
                .offset(y: 3)
        }
        .frame(width: 300)
        .padding(.top, padding)
        PA_UnderlineView()
    }
}

//#Preview {
//    PA_SecureFieldView()
//}
