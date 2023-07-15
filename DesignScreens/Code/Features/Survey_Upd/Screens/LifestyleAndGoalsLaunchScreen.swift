//
//  LifestyleAndGoalsLaunchScreen.swift
//  DesignScreens
//
//  Created by Aziz's MacBook Air on 14.07.2023.
//

import SwiftUI

struct LifestyleAndGoalsLaunchScreen: View {
    var body: some View {
        ZStack {
            
            Rectangle()
                .fill(Color(hex: "06201b"))
                .edgesIgnoringSafeArea(.bottom)
            
            Rectangle()
                .fill(Color.black)
                .edgesIgnoringSafeArea(.top)
            
              
            Triangle()
                .fill(Color(hex: "#05211b"))

            Triangle()
                .fill(Color(hex: "#053723"))
                .ignoresSafeArea()
                .offset(y: 150)
            
            Triangle()
                .fill(Color(hex: "#054b2a"))
                .ignoresSafeArea()
                .offset(y: 300)
            
          
            
            VStack(spacing: 40) {
                Image("lifestyle_goals_image")
                Text("Lifestyle & Goals")
                    .underline()
                    .font(Font.system(size: 40).weight(.black))
                    .foregroundColor(Color(hex: "00FF1A"))
                    .multilineTextAlignment(.center)
                    .padding(.top, -40)
                
            }
        }
    }
}

struct LifestyleAndGoalsLaunchScreen_Previews: PreviewProvider {
    static var previews: some View {
        LifestyleAndGoalsLaunchScreen()
    }
}
