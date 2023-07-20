//
//  RoutinesAndSyncLaunchScreen.swift
//  DesignScreens
//
//  Created by Aziz's MacBook Air on 20.07.2023.
//

import SwiftUI

struct RoutinesAndSyncLaunchScreen: View {
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
            
            Triangle()
                .fill(Color(hex: "#055d30"))
                .ignoresSafeArea()
                .offset(y: 450)
            
          
            
            VStack(spacing: 30) {
                Image("routines_sync")
                Text("Routines & Sync")
                    .underline()
                    .font(Font.system(size: 40).weight(.black))
                    .foregroundColor(Color(hex: "00FF1A"))
                    .multilineTextAlignment(.center)
                
            }
        }
    }
}

struct RoutinesAndSyncLaunchScreen_Previews: PreviewProvider {
    static var previews: some View {
        RoutinesAndSyncLaunchScreen()
    }
}
