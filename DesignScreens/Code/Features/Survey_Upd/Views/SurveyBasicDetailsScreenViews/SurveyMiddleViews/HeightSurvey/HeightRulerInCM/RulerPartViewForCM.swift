//
//  RulerPartViewForCM.swift
//  DesignScreens
//
//  Created by Aziz's MacBook Air on 08.07.2023.
//

import SwiftUI

struct RulerPartViewForCM: View {
    
    var num: String = ""
    var isHidden: Bool = false
    
    var body: some View {
        
        VStack(alignment: .trailing, spacing: 0) {
            
            VStack(spacing: Sizes.size(18)) {
                
                ForEach(0..<9) { id in
                    
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: Sizes.size(45), height: Sizes.size(2))
                        .background(Color(hex: "#BEBEBE"))
                        .cornerRadius(5)
                    
                }
                
            }
            
            Color.clear
                .frame(height: Sizes.size(18))
            
            HorizontalLine(num: num)
            
        }
        .opacity(isHidden ? 0.0 : 1.0)
    }
    
}
