//
//  PA_TextFieldView.swift
//  Portfolio_LogInPage
//
//  Created by Vince Muller on 7/21/24.
//

import SwiftUI

struct PA_TextFieldView: View {
    var icon: String = ""
    var placeholder: String = ""
    @State var text: String = ""
    var padding: CGFloat = 0
    var fontSize: CGFloat = 20
    
    var body: some View {
        HStack (alignment: .bottom) {
            Image(systemName: icon)
                .font(.system(size: fontSize))
                .foregroundStyle(.black)
            TextField(placeholder, text: $text)
                .font(.system(size: 20))
                .foregroundStyle(.black)
                .offset(y: 3)
        }
        .frame(width: 300)
        .padding(.top, padding)
        PA_UnderlineView()
    }
}

#Preview {
    PA_TextFieldView()
}
