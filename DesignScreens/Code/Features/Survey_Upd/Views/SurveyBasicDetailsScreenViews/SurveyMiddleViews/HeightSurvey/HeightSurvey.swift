//
//  HeightSurvey.swift
//  DesignScreens
//
//  Created by Aziz's MacBook Air on 07.07.2023.
//

import SwiftUI

struct HeightSurvey: View {
    
    @EnvironmentObject var basicSurveyVM: SurveyVM
    
    var body: some View {
        VStack {
            Toggle("", isOn: $basicSurveyVM.isEnabledCM)
                .toggleStyle(SurveyToggleStyle(unit1: "cm", unit2: "ft"))
                .padding()
            
            HeightRuler()
                .clipped()
        }
    }
}

struct HeightSurvey_Previews: PreviewProvider {
    static let basicSurveyVM = SurveyVM()
    static var previews: some View {
        HeightSurvey()
            .environmentObject(basicSurveyVM)
    }
}
