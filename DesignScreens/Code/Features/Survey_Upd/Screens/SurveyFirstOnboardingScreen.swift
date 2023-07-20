//
//  SurveyFirstOnboardingScreen.swift
//  DesignScreens
//
//  Created by Aziz's MacBook Air on 20.07.2023.
//

import SwiftUI

struct SurveyFirstOnboardingScreen: View {
    
    @State private var nextBtnEnabled: Bool = true
    @EnvironmentObject var basicSurveyVM: SurveyVM
    var body: some View {
        ZStack {
            
            Color(hex: "#050813")
                .ignoresSafeArea()
            
            VStack {
                topRightLanuageBtn
                Spacer()
            }
            
            GeometryReader { geo in
                ScrollView(.vertical, showsIndicators: false) {
                    
                    VStack {
                        Spacer()
                        
                        Button(action: {
                            print("Start Surrvey")
                            basicSurveyVM.startSurveyBtnClick()
                        }, label: {
                            Text("START")
                                .modifier(BtnText(enabled: $nextBtnEnabled))
                        })
                        .padding(.horizontal, 45)
                        
                        Spacer()
                            .frame(height: 30)
                        
                        HaveAccountView()
                            .padding(.bottom, 55)
                        
                    }
                    .frame(
                        minWidth: geo.size.width,
                        minHeight: geo.size.height
                    )
                    
                }
            }
        }
    }
    
    var topRightLanuageBtn: some View {
        HStack {
            Spacer()
            Button {
                print("Change Language")
            } label: {
                Text("EN")
                    .font(.title2)
                    .fontWeight(.heavy)
                    .foregroundColor(.white)
                    .opacity(0.5)
                    .padding(.trailing, 30)
                    .padding(.top, 25)
            }
        }
    }
    
}

struct SurveyFirstOnboardingScreen_Previews: PreviewProvider {
    static var previews: some View {
        SurveyFirstOnboardingScreen()
    }
}
