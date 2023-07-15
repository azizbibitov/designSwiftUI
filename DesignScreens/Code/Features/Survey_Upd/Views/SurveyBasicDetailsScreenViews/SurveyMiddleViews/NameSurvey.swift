//
//  NameSurvey.swift
//  DesignScreens
//
//  Created by Aziz's MacBook Air on 05.07.2023.
//

import SwiftUI
import Introspect

struct NameSurvey: View {
    
    @EnvironmentObject var basicSurveyVM: SurveyVM
    
    var body: some View {
        VStack {
            if #available(iOS 15.0, *) {
                TextField("full_name".localizable, text: $basicSurveyVM.userName)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white)
                    .dynamicFontSize(text: $basicSurveyVM.userName)
                    .padding(.top,30).padding(.bottom, 10)
                    .submitLabel(.done)
                    .introspectTextField { textField in
                        if basicSurveyVM.surveyProgress == 1 && basicSurveyVM.screensProgress == 5 {/// this condition for removing introspectTextfield glitching effect
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5){
                                textField.becomeFirstResponder()
                            }
                        }
                    }
                    .onChange(of: basicSurveyVM.userName, perform: {
                        new in
                        basicSurveyVM.checker()
                    })
            } else {
                TextField("full_name".localizable, text: $basicSurveyVM.userName)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white)
                    .dynamicFontSize(text: $basicSurveyVM.userName)
                    .padding(.top,30).padding(.bottom, 10)
                    .introspectTextField { textField in
                        if basicSurveyVM.surveyProgress == 1 && basicSurveyVM.screensProgress == 5 {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5){
                                textField.becomeFirstResponder()
                            }
                        }
                    }
                    .onChange(of: basicSurveyVM.userName, perform: {
                        new in
                        basicSurveyVM.checker()
                    })
            }
            
            Divider().padding(.horizontal).overlay(Color(hex: "#515151").padding(.horizontal))
            
        }
        .onAppear {
            basicSurveyVM.checker()
        }
    }
}

struct NameSurveyField_Previews: PreviewProvider {
    static let basicSurveyVM = SurveyVM()
    static var previews: some View {
        NameSurvey()
            .environmentObject(basicSurveyVM)
    }
}

