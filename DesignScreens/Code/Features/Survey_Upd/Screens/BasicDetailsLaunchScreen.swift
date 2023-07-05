//
//  BasicDetailsLaunchScreen.swift
//  DesignScreens
//
//  Created by Aziz's MacBook Air on 02.07.2023.
//

import SwiftUI

struct BasicDetailsLaunchScreen: View {
    var body: some View {
        ZStack {
            
            Rectangle()
                .fill(Color(hex: "06201b"))
                .edgesIgnoringSafeArea(.bottom)
            
            Rectangle()
                .fill(Color.black)
                .edgesIgnoringSafeArea(.top)
            
              
            Triangle()
                .fill(Color(hex: "06201b"))

            Triangle()
                .fill(Color(hex: "00FF66").opacity(0.1))
                .ignoresSafeArea()
                .offset(y: 120)
            
            
            VStack(spacing: 0) {
                Image("basic-details-launch")
                Text("Profile Details")
                    .underline()
                    .font(Font.system(size: 40).weight(.black))
                    .foregroundColor(Color(hex: "00FF1A"))
                    .multilineTextAlignment(.center)
                    .padding(.top, -40)
                
            }
        }
    }
}

struct BasicDetailsLaunchScreen_Previews: PreviewProvider {
    static var previews: some View {
        BasicDetailsLaunchScreen()
            .previewDevice(PreviewDevice(rawValue: DeviceName.iPhone_14.rawValue))
    }
}
