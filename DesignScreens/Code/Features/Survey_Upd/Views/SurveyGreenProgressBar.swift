//
//  SurveyGreenProgressBar.swift
//  DesignScreens
//
//  Created by Aziz's MacBook Air on 03.07.2023.
//

import SwiftUI

import SwiftUI

struct SurveyGreenProgressBar: View {
    
    @EnvironmentObject var basicSurveyVM: SurveyVM
    
    var body: some View {
        HStack(spacing: 3) {
            ForEach(0..<basicSurveyVM.maxElements, id: \.self) { i in
                RoundedRectangle(cornerRadius: 3)
                    .fill(setColor(i))
                    .frame(width: 22, height: 2)
                
            }
        }
    }
    
    func setColor(_ ind: Int) -> Color {
        if basicSurveyVM.progress >= ind {
            return Color(hex: "#42FF00")
        }else{
            return Color(hex: "#D9D9D9")
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
