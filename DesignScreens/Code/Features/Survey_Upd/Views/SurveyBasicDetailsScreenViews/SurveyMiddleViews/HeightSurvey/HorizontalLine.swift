//
//  LongLine.swift
//  DesignScreens
//
//  Created by Aziz's MacBook Air on 08.07.2023.
//

import SwiftUI

struct HorizontalLine: View {
    
    var num: Int = 0
    
    var body: some View {
        HStack {
            
            Rectangle()
                .foregroundColor(.clear)
                .frame(width: Sizes.size(70), height: Sizes.size(4))
                .background(Color(hex: "#BEBEBE"))
                .cornerRadius(5)
        }
        .overlay(
            HStack {
                Text("\(num)")
                    .foregroundColor(.white)
                    .font(.title2.weight(.bold))
                
                Spacer()
            }
                .frame(width: Sizes.size(170))
            ,alignment: .trailing
        )
    }
}
