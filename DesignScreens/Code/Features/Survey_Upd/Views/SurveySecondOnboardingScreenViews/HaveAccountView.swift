//
//  HaveAccountView.swift
//  DesignScreens
//
//  Created by Aziz's MacBook Air on 02.07.2023.
//

import SwiftUI

struct HaveAccountView: View {
    @EnvironmentObject var basicSurveyVM: SurveyVM
    var body: some View {
        VStack(alignment: .center, spacing: 20) {
            HStack (spacing: 9){
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(height: 1)
                    .background(Color(hex: "#D9D9D9"))
                Text("Already have an account?")
                    .font(.subheadline)
                    .lineLimit(1)
                    .scaledToFill()
                    .foregroundColor(Color(hex: "#909090"))
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(height: 1)
                    .background(Color(hex: "#D9D9D9"))
            }
            
            Button {
                print("SignIn")
                basicSurveyVM.isBack = false
                basicSurveyVM.screensProgress = 1
            } label: {
                Text("Sign in to your existing account")
                    .font(.subheadline)
                    .underline()
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white)
            }
            
        }
    }
}

//struct HaveAccountView_Previews: PreviewProvider {
//    static var previews: some View {
//        HaveAccountView()
//    }
//}
