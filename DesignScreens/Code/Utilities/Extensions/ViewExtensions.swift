//
//  ViewExtensions.swift
//  DesignScreens
//
//  Created by Aziz's MacBook Air on 05.07.2023.
//

import SwiftUI

extension View {
    func dynamicFontSize(text: Binding<String>) -> some View {
        return self.modifier(DynamicFontSizeModifier(text: text))
    }
    
    func placeholder<Content: View>(
           when shouldShow: Bool,
           alignment: Alignment = .leading,
           @ViewBuilder placeholder: () -> Content) -> some View {

           ZStack(alignment: alignment) {
               placeholder().opacity(shouldShow ? 1 : 0)
               self
           }
       }
    
}

#if canImport(UIKit)
extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
#endif
