//
//  PA_SecondaryCTAButtonView.swift
//  Portfolio_LogInPage
//
//  Created by Vince Muller on 7/21/24.
//

import SwiftUI

struct PA_SecondaryCTAButtonView: View {
    var action: () -> Void = {print("function to execute")}
    var label: String = ""
    
    var body: some View {
        Button(action: action, label: {
            Text(label)
                .font(.system(size: 14))
                .foregroundStyle(.black)
        })
    }
}

#Preview {
    PA_SecondaryCTAButtonView()
}
