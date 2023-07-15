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

extension View {
    /// Hide or show the view based on a boolean value.
    ///
    /// Example for visibility:
    ///
    ///     Text("Label")
    ///         .isHidden(true)
    ///
    /// Example for complete removal:
    ///
    ///     Text("Label")
    ///         .isHidden(true, remove: true)
    ///
    /// - Parameters:
    ///   - hidden: Set to `false` to show the view. Set to `true` to hide the view.
    ///   - remove: Boolean value indicating whether or not to remove the view.
    @ViewBuilder func isHidden(_ hidden: Bool, remove: Bool = false) -> some View {
        if hidden {
            if !remove {
                self.hidden()
            }
        } else {
            self
        }
    }
}
