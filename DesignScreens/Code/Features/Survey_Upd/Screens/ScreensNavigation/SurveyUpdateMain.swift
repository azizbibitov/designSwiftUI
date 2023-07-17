//
//  SurveyUpdateMain.swift
//  DesignScreens
//
//  Created by Aziz's MacBook Air on 14.07.2023.
//

import SwiftUI

struct SurveyUpdateMain: View {
    
    @EnvironmentObject var basicSurveyVM: SurveyVM
    
    
    
    var body: some View {
        ZStack {
            
            Color.black
                .edgesIgnoringSafeArea(.all)
            
            ZStack {
                
                Group {
                    
                    if basicSurveyVM.screensProgress == 3 {
                        SurveySecondOnboardingScreen()
                    }
                    
                    if basicSurveyVM.screensProgress == 4 {
                        BasicDetailsLaunchScreen()
                    }
                    
                    if basicSurveyVM.screensProgress == 5 {
                        SurveysScreen()
                    }
                    
                    if basicSurveyVM.screensProgress == 6 {
                        LifestyleAndGoalsLaunchScreen()
                    }
                    
                    
                    
                }
                .transition(AnyTransition.asymmetric(
                    insertion:.move(edge: basicSurveyVM.isBack ? .leading : .trailing),
                    removal: .move(edge: basicSurveyVM.isBack ? .trailing : .leading))
                )
                .animation(.default, value: basicSurveyVM.screensProgress)
                
            }
            
            
            
        }
    }
}

struct SurveyUpdateMain_Previews: PreviewProvider {
    static let basicSurveyVM = SurveyVM()
    static var previews: some View {
        SurveyUpdateMain()
            .environmentObject(basicSurveyVM)
    }
}
