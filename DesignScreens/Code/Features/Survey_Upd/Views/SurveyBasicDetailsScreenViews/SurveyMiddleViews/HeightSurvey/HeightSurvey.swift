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
        VStack(spacing: 30){
            Toggle("", isOn: $basicSurveyVM.measureInFT)
                .toggleStyle(SurveyToggleStyle(unit1: "cm", unit2: "ft"))
                .padding()
            
            VStack(spacing: 0){
                HeightRulerInFT()
                    .clipped()
                    .opacity(basicSurveyVM.measureInFT ? 1 : 0)
                    .frame(height: basicSurveyVM.measureInFT ? nil : 0)
                
                HeightRulerInCM()
                    .clipped()
                    .opacity(basicSurveyVM.measureInFT ? 0 : 1)
                    .frame(height: basicSurveyVM.measureInFT ? 0 : nil)
            }
        }
        
        .onAppear {
            basicSurveyVM.checker()
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
