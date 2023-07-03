//
//  SurveyTitle.swift
//  DesignScreens
//
//  Created by Aziz's MacBook Air on 03.07.2023.
//

import SwiftUI

struct SurveyTitleModifier: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .font(.title.weight(.bold))
            .multilineTextAlignment(.center)
            .foregroundColor(.white)
    }
}
