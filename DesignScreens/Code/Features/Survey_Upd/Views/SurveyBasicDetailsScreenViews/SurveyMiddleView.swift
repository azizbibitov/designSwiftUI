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
            default: ZStack{}
            }
            
            // made this views seperate from switch cause could'nt figure out yet how to save scroll position of views
            HeightSurvey()
                .opacity(basicSurveyVM.progress == 4 ? 1 : 0)
                .frame(height: basicSurveyVM.progress == 4 ? nil : 0)
                .clipped()
                .transition(.opacity)
            
            WidthSurvey()
                .opacity(basicSurveyVM.progress == 5 ? 1 : 0)
                .frame(height: basicSurveyVM.progress == 5 ? nil : 0)
                .clipped()
                .transition(.opacity)
            
            
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
