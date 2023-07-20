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
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: Sizes.size(30)){
                Spacer()
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
                Spacer()
            }
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
