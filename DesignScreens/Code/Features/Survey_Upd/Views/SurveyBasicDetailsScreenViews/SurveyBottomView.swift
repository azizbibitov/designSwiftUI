//
//  SurveyBottomView.swift
//  DesignScreens
//
//  Created by Aziz's MacBook Air on 06.07.2023.
//

import SwiftUI

struct SurveyBottomView: View {
    @EnvironmentObject var basicSurveyVM: SurveyVM
    var body: some View {
        
        VStack(spacing: 22){
            
            Button(action: {
                let generator = UIImpactFeedbackGenerator(style: .light)
                generator.impactOccurred()
                hideKeyboard()
                basicSurveyVM.nextPressed()
            }, label: {
                Text("Next")
                    .modifier(BtnText(enabled: $basicSurveyVM.nextEnabled))
            })
            .padding(.horizontal, 45)
            .padding(.top, 10)
            
            otherOptionText
            
        }
        .padding(.bottom, 50)
        
        
    }
    
    @ViewBuilder var otherOptionText: some View {
        if basicSurveyVM.surveyProgress == 2 {
            Button {
                basicSurveyVM.chooseGenderOthers()
            } label: {
                Text("Others / I’d rather not say")
                    .font(.headline)
                    .foregroundColor(.white)
            }
        }
    }
}

struct SurveyBottomView_Previews: PreviewProvider {
    static var previews: some View {
        SurveyBottomView()
    }
}
