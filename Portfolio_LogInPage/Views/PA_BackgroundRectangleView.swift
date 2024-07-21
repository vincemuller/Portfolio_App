//
//  PA_BackgroundRectangleView.swift
//  Portfolio_LogInPage
//
//  Created by Vince Muller on 7/21/24.
//

import SwiftUI

struct PA_BackgroundRectangleView: View {
    var cornerRadius: CGFloat = 20
    var width: CGFloat = 360
    var height: CGFloat = 410
    
    var body: some View {
        RoundedRectangle(cornerRadius: cornerRadius)
            .fill(.white)
            .frame(width: width, height: height)
    }
}

#Preview {
    PA_BackgroundRectangleView()
}
