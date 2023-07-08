//
//  SurveyMiddleView.swift
//  DesignScreens
//
//  Created by Aziz's MacBook Air on 05.07.2023.
//a

import SwiftUI

struct SurveyMiddleView: View {
    @EnvironmentObject var basicSurveyVM: SurveyVM
    var body: some View {
        VStack {
            switch basicSurveyVM.progress {
            case 1:
                NameSurvey()
            case 2:
                GenderSurvey()
            case 3:
                BirthdaySurvey()
            case 4:
                HeightSurvey()
            default: ZStack{}
            }
        }
        
    }
    
}

struct SurveyMiddleView_Previews: PreviewProvider {
    static let basicSurveyVM = SurveyVM()
    static var previews: some View {
        SurveyMiddleView()
            .environmentObject(basicSurveyVM)
    }
}
