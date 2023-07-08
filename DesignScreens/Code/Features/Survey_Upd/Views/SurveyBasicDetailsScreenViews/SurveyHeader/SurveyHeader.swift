//
//  SurveyHeader.swift
//  DesignScreens
//
//  Created by Aziz's MacBook Air on 03.07.2023.
//

import SwiftUI

struct SurveyHeader: View {
    @EnvironmentObject var basicSurveyVM: SurveyVM
    var body: some View {
        HStack {
            Button {
                hideKeyboard()
                basicSurveyVM.prevSurvey()
            } label: {
                Image("arrow-right")
                   
            }

            Spacer()
            
            VStack(spacing: 14){
                Text("Basic Details")
                    .font(.headline.weight(.bold))
                    .foregroundColor(.white)
                SurveyGreenProgressBar()
            }
            
            Spacer()
        }
        .padding(.leading, 20)
    }
}

struct SurveyHeader_Previews: PreviewProvider {
    static let basicSurveyVM = SurveyVM()
    static var previews: some View {
        SurveyHeader()
            .environmentObject(basicSurveyVM)
    }
}
