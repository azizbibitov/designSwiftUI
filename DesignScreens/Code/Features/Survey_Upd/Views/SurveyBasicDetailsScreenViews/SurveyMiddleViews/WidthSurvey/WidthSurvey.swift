//
//  WidthSurvey.swift
//  DesignScreens
//
//  Created by Aziz's MacBook Air on 11.07.2023.
//

import SwiftUI

struct WidthSurvey: View {
    
    @EnvironmentObject var basicSurveyVM: SurveyVM
    
    var body: some View {
        
        VStack(spacing: Sizes.size(30)){
            
            Toggle("", isOn: $basicSurveyVM.measureInLB)
                .toggleStyle(SurveyToggleStyle(unit1: "kg", unit2: "lb"))
                .padding()
            
            VStack(spacing: 0){
                WidthRulerLB()
                    .clipped()
                    .opacity(basicSurveyVM.measureInLB ? 1 : 0)
                    .frame(height: basicSurveyVM.measureInLB ? nil : 0)
                    .transition(.slide)
                
                WidthRulerKG()
                    .clipped()
                    .opacity(basicSurveyVM.measureInLB ? 0 : 1)
                    .frame(height: basicSurveyVM.measureInLB ? 0 : nil)
                    .transition(.slide)
            }
            .cornerRadius(50)
            .clipped()
            
            BMIDefinerView()
        }
        
        .onAppear {
            basicSurveyVM.checker()
        }
        
    }
}

struct WidthSurvey_Previews: PreviewProvider {
    static let basicSurveyVM = SurveyVM()
    static var previews: some View {
        WidthSurvey()
            .environmentObject(basicSurveyVM)
    }
}
