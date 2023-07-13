//
//  VerticalLine.swift
//  DesignScreens
//
//  Created by Aziz's MacBook Air on 12.07.2023.
//

import SwiftUI

struct VerticalLine: View {
    
    var num: Int = 999
    
    var body: some View {
        HStack {
            
            Rectangle()
                .foregroundColor(.clear)
                .frame(width: 4, height: Sizes.size(70))
                .background(Color(hex: "#BEBEBE"))
                .cornerRadius(5)
        }
        .overlay(
            VStack {
                Text("\(num)")
                    .foregroundColor(.black)
                    .font(Font.system(size: Sizes.size(25), weight: .bold))
                
                Spacer()
            }
                .frame(width: 50, height: Sizes.size(150))
            ,alignment: .center
        )
    }
}

struct VerticalLine_Previews: PreviewProvider {
    static var previews: some View {
        VerticalLine()
    }
}
