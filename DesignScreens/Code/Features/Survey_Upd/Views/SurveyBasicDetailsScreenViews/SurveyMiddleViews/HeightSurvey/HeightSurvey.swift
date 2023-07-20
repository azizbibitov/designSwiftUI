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
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 10){
                Spacer()
                Toggle("", isOn: $basicSurveyVM.measureInFT)
                    .toggleStyle(SurveyToggleStyle(unit1: "cm", unit2: "ft"))
                    .padding()
                
                if basicSurveyVM.measureInFT {
                    HeightRulerInFT()
                        .clipped()
                }else{
                    HeightRulerInCM()
                        .clipped()
                }
                Spacer()
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
