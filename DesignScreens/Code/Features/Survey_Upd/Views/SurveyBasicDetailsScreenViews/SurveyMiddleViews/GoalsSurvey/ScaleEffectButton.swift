//
//  ScaleEffectButton.swift
//  DesignScreens
//
//  Created by Aziz's MacBook Air on 15.07.2023.
//

import SwiftUI

struct ScaleEffectButton: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 1.1 : 1)
    }
}
