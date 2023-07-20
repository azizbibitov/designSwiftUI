//
//  SurveyTitle.swift
//  DesignScreens
//
//  Created by Aziz's MacBook Air on 03.07.2023.
//

import SwiftUI

struct SurveyTitle: View {
    
    @EnvironmentObject var basicSurveyVM: SurveyVM
    
    let surveyTitles: [[String]] = [
        ["full_name_asks", "", ""],
        ["nice_to_meet_you", "what_is_your", "_gender_"],
        ["", "when_is_your", "_birthday_"],
        ["", "What_is_your_height", "_height_"],
        ["", "What_is_your_weight", "_weight_"],
        ["main_goals_asks", "", ""],
        ["focus_areas_asks", "", ""],
        ["body_shape_asks", "", ""],
        ["physical_pain_experience_asks", "", ""],
        ["diagnose_asks", "", ""],
        ["activity_level_asks", "", ""],
    ]
    
    var title1Show: Bool {
        switch basicSurveyVM.surveyProgress {
        case 1, 2, 6, 7, 8, 9, 10, 11:
            return true
        default: return false
        }
    }
    
    var title2Show: Bool {
        switch basicSurveyVM.surveyProgress {
        case 1, 6, 7, 8, 9, 10, 11:
            return false
        default: return true
        }
    }
    
    var body: some View {
        VStack{
            if title1Show {
                Text("\(surveyTitles[basicSurveyVM.surveyProgress-1][0])".localizable(arguments: basicSurveyVM.userName))
                    .padding(.top, 40)
                    .modifier(SurveyTitleModifier())
            }else{
                Spacer()
                    .frame(height: 46)
            }
            
            
            if title2Show {
                (Text("\(surveyTitles[basicSurveyVM.surveyProgress-1][1])".localizable).foregroundColor(.white) + Text("\(surveyTitles[basicSurveyVM.surveyProgress-1][2])".localizable).foregroundColor(Color(hex: "#05FF00")) + Text("?").foregroundColor(.white))
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
