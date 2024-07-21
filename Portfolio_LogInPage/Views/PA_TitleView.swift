//
//  PA_TitleView.swift
//  Portfolio_LogInPage
//
//  Created by Vince Muller on 7/21/24.
//

import SwiftUI

struct PA_TitleView: View {
    var title: String = ""
    var subtitle: String = ""
    
    var body: some View {
        VStack {
            Text(title)
                .font(.system(size: 25, weight: .semibold, design: .serif))
                .foregroundStyle(.black)
            Text(subtitle)
                .multilineTextAlignment(.center)
                .foregroundStyle(.black)
        }
    }
}

#Preview {
    PA_TitleView()
}
