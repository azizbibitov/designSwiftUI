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
                .fill(Color.black)
                .ignoresSafeArea()
                .overlay(
                    Triangle()
                        .fill(Color(hex: "06201b"))
                        .ignoresSafeArea()
                )
            
            VStack(spacing: 40) {
                Image("basic-details-doctor")
                Text("Basic Details")
                    .underline()
                    .font(Font.system(size: 40).weight(.black))
                    .foregroundColor(Color(hex: "00FF1A"))
                    .multilineTextAlignment(.center)
                  
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
