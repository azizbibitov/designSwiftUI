//
//  BtnText.swift
//  DesignScreens
//
//  Created by Aziz's MacBook Air on 02.07.2023.
//

import SwiftUI

struct BtnText: ViewModifier {
    @Binding var enabled: Bool
    
    func body(content: Content) -> some View {
        content
            .shadow(color: .black, radius: 5, x: 0, y: 5)
            .frame(maxWidth: .infinity)
            .font(.largeTitle.weight(.bold))
            .foregroundColor(enabled ? .white : Color(hex: "#777777"))
            .padding(.vertical, Sizes.size(19))
            .background(enabled ? Color(hex: "#05FF00") : Color(hex: "#292929"))
            .cornerRadius(30)
           
    }
}
