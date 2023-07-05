//
//  DynamicFontSizeModifier.swift
//  DesignScreens
//
//  Created by Aziz's MacBook Air on 05.07.2023.
//

import SwiftUI

struct DynamicFontSizeModifier: ViewModifier {
    @Binding var text: String
    
    func body(content: Content) -> some View {
        let baseFontSize: CGFloat = 40.0
        let minFontSize: CGFloat = 20.0 // Set minimum font size here
        let length = text.count
        var fontSize = length < 10 ? baseFontSize : baseFontSize - CGFloat((length - 10) * 2)  // Modify the math here to suit your requirements.
        
        // Make sure fontSize doesn't go below the minimum
        fontSize = max(minFontSize, fontSize)
        
        return content
            .font(.system(size: fontSize, weight: .black)) // Here's where we set the fontWeight
    }
}
