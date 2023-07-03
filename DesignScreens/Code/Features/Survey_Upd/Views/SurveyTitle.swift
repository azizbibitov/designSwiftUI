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
        ["", "What_is_your", "_height_"],
        ["", "What_is_your", "_weight_"]
    ]
    
    var title1Show: Bool {
        if basicSurveyVM.progress == 0 || basicSurveyVM.progress == 1{
            return true
        }
        return false
    }
    
    var title2Show: Bool {
        if basicSurveyVM.progress == 0{
            return false
        }
        return true
    }
    
    var body: some View {
        VStack{
            if title1Show {
                Text("\(surveyTitles[basicSurveyVM.progress][0])".localized(arguments: basicSurveyVM.userName))
                    .padding(.top, 40)
                    .modifier(SurveyTitleModifier())
            }
            
            if title2Show {
                (Text("\(surveyTitles[basicSurveyVM.progress][1])".localized).foregroundColor(.white) + Text("\(surveyTitles[basicSurveyVM.progress][2])".localized).foregroundColor(Color(hex: "#05FF00")) + Text("?").foregroundColor(.white))
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
