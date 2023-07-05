//
//  ProportionallyColoredRectangle.swift
//  DesignScreens
//
//  Created by Aziz's MacBook Air on 05.07.2023.
//

import SwiftUI

struct ProportionalColoredRectangleView: View {
    let firstColor: Color
    let secondColor: Color
    let colorProportion: CGFloat
    let cornerRadius: CGFloat
    
    var body: some View {
        GeometryReader { geometry in
            HStack(spacing: 0) {
                Rectangle()
                    .fill(firstColor)
                    .frame(width: geometry.size.width * colorProportion)
                Rectangle()
                    .fill(secondColor)
                    .frame(width: geometry.size.width * (1 - colorProportion))
            }
        }
        .cornerRadius(cornerRadius)
    }
}

struct ProportionalColoredRectangleView_Previews: PreviewProvider {
    static var previews: some View {
        ProportionalColoredRectangleView(firstColor: .red, secondColor: .blue, colorProportion: 0.3, cornerRadius: 30)
            .frame(height: 100)
    }
}
