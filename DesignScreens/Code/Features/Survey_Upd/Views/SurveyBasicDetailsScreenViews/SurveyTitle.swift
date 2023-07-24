//
//  SurveyTitle.swift
//  DesignScreens
//
//  Created by Aziz's MacBook Air on 03.07.2023.
//

import SwiftUI

struct SurveyTitle: View {
    
    @EnvironmentObject var basicSurveyVM: SurveyVM
    
    var title1Show: Bool {
        switch basicSurveyVM.surveyProgress {
        case 1, 2, 6, 7, 8, 9, 10, 11, 12:
            return true
        default: return false
        }
    }
    
    var title2Show: Bool {
        switch basicSurveyVM.surveyProgress {
        case 1, 6, 7, 8, 9, 10, 11, 12:
            return false
        default: return true
        }
    }
    
    var body: some View {
        VStack{
            if title1Show {
                Text("\(basicSurveyVM.surveyTitles[basicSurveyVM.surveyProgress-1][0])".localizable(arguments: basicSurveyVM.userName))
                    .padding(.top, 40)
                    .modifier(SurveyTitleModifier())
            }else{
                Spacer()
                    .frame(height: 46)
            }
            
            
            if title2Show {
                (Text("\(basicSurveyVM.surveyTitles[basicSurveyVM.surveyProgress-1][1])".localizable).foregroundColor(.white) + Text("\(basicSurveyVM.surveyTitles[basicSurveyVM.surveyProgress-1][2])".localizable).foregroundColor(Color(hex: "#05FF00")) + Text("?").foregroundColor(.white))
                    .modifier(SurveyTitleModifier())
            }
        }
    }
}

struct SurveyTitle_Previews: PreviewProvider {
    static let basicSurveyVM = SurveyVM()
    static var previews: some View {
        SurveyTitle()
            .environmentObject(basicSurveyVM)
    }
}
