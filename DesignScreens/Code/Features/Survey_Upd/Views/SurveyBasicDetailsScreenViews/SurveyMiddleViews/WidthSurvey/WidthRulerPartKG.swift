//
//  WidthRulerPart.swift
//  DesignScreens
//
//  Created by Aziz's MacBook Air on 12.07.2023.
//

import SwiftUI

struct WidthRulerPart: View {
    
    var num: Int = 0
    
    var body: some View {
        
        VStack {
            
            Spacer()
            // Width = 103
            HStack(alignment: .bottom, spacing: 9){
                
                VerticalLine(num: num)
                
                ForEach(0..<9) { id in
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 2, height: Sizes.size(35))
                        .background(Color(hex: "#BEBEBE"))
                        .cornerRadius(5)
                }
                
                
            }
            
        }
        
    }
    
}

struct WidthRulerPart_Previews: PreviewProvider {
    static var previews: some View {
        WidthRulerPart()
    }
}
