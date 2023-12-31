//
//  SurveysScreen.swift
//  DesignScreens
//
//  Created by Aziz's MacBook Air on 02.07.2023.
//

import SwiftUI

struct SurveysScreen: View {
    
    @Environment(\.safeAreaInsets) private var safeAreaInsets
    @EnvironmentObject var basicSurveyVM: SurveyVM
    @State private var nextBtnEnabled: Bool = true
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Color(hex: "#050813")
                    .ignoresSafeArea()
                
                VStack {
                    SurveyHeader()
                        .padding(.top, safeAreaInsets.top)
                    
                    
                    Spacer()
                }
                .frame(width: UIScreen.screenWidth)
                
                VStack {
                    Spacer()
                        .frame(height: Sizes.size(45 + safeAreaInsets.top))
                    
                    SurveyTitle()
                        .padding(.top, 30)
                        .padding(.bottom, 10)
                    
                    Spacer()
                    
                    SurveyMiddleView()
                    
                    Spacer()
                    
                    SurveyBottomView()
                    
                }
                
            }
            .frame(width: UIScreen.screenWidth, height: UIScreen.screenHeight)
            .edgesIgnoringSafeArea(.all)
            
        }
        .ignoresSafeArea(.keyboard, edges: .all)
        .onTapGesture {
            hideKeyboard()
        }
        
    }
    
}

struct SurveyBasicDetailsScreen_Previews: PreviewProvider {
    static let basicSurveyVM = SurveyVM()
    static var previews: some View {
        SurveysScreen()
            .environmentObject(basicSurveyVM)
    }
}
