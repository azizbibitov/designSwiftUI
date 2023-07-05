//
//  SurveyGreenProgressBar.swift
//  DesignScreens
//
//  Created by Aziz's MacBook Air on 03.07.2023.
//

import SwiftUI

struct SurveyGreenProgressBar: View {
    
    @EnvironmentObject var basicSurveyVM: SurveyVM
    
    var body: some View {
        HStack(spacing: 10) {
            ForEach(0..<3, id: \.self) { i in
                ProportionalColoredRectangleView(firstColor: Color(hex: "#42FF00"), secondColor: Color(hex: "#D9D9D9"), colorProportion: basicSurveyVM.getProgressPercentage(section: i), cornerRadius: 30)
                    .frame(width: 50, height: 4)
            }
        }
    }
    
}

struct SurveyGreenProgressBar_Previews: PreviewProvider {
    static let basicSurveyVM = SurveyVM()
    static var previews: some View {
        SurveyGreenProgressBar()
            .environmentObject(basicSurveyVM)
    }
}
