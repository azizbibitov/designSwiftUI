//
//  SurveySecondOnboardingScreen.swift
//  DesignScreens
//
//  Created by Aziz's MacBook Air on 02.07.2023.
//

import SwiftUI

struct SurveySecondOnboardingScreen: View {
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
            
            VStack {
                Image("personal-couch")
                    .resizable(resizingMode: .stretch)
                    .frame(width: Sizes.size(319), height: Sizes.size(358))
                    .padding(.top, 40)
                
                Spacer()
                
                VStack(alignment: .leading, spacing: 0) {
             
                    Text("Hi!")
                        .font(.largeTitle.weight(.bold))
                        .foregroundColor(.white)
                    
                    Text("I am your personal coach. Please answer some question to get personalized plans.")
                        .font(.title2)
                        .foregroundColor(.white)
                }
                .padding(.horizontal, 45).padding(.top, 10).padding(.bottom, 30)
                .background(Rectangle().fill(Color(red: 0.17, green: 0.17, blue: 0.17).opacity(0.5)).cornerRadius(30))
                
                Spacer()
                
                Button(action: {
                    print("I’M READY")
                    basicSurveyVM.iamReadyBtnClick()
                }, label: {
                    Text("I’M READY")
                        .modifier(BtnText(enabled: $nextBtnEnabled))
                })
                .padding(.horizontal, 45)
                
                Spacer()
                
                HaveAccountView()
                    .padding(.bottom, 55)
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

struct SurveySecondOnboardingScreen_Previews: PreviewProvider {
    static var previews: some View {
        SurveySecondOnboardingScreen()
            .previewDevice(PreviewDevice(rawValue: DeviceName.iPhone_14.rawValue))

    }
}
