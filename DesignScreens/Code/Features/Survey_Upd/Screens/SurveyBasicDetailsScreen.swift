//
//  SurveyBasicDetailsScreen.swift
//  DesignScreens
//
//  Created by Aziz's MacBook Air on 02.07.2023.
//

import SwiftUI

struct SurveyBasicDetailsScreen: View {
    
    @EnvironmentObject var basicSurveyVM: SurveyVM
    @State private var nextBtnEnabled: Bool = true
    
    var body: some View {
        ZStack {
            Color(hex: "#050813")
                .ignoresSafeArea()
            
            VStack {
                SurveyHeader()
                    .padding(.top, 30)
                
                SurveyTitle()
                
                Spacer()
                
                SurveyMiddleView()
                
                Spacer()
                
                Button(action: {
                    hideKeyboard()
                    basicSurveyVM.nextPressed()
                }, label: {
                    Text("Next")
                        .modifier(BtnText(enabled: $basicSurveyVM.nextEnabled))
                })
                .padding(.horizontal, 45)
                .padding(.bottom, 50)
                
            }
        }
        
        .onTapGesture {
            hideKeyboard()
        }
    }
    
}

struct SurveyBasicDetailsScreen_Previews: PreviewProvider {
    static let basicSurveyVM = SurveyVM()
    static var previews: some View {
        SurveyBasicDetailsScreen()
            .environmentObject(basicSurveyVM)
    }
}
