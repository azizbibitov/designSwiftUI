//
//  BMIDefinerView.swift
//  DesignScreens
//
//  Created by Aziz's MacBook Air on 12.07.2023.
//

import SwiftUI

struct BMIDefinerView: View {
    var body: some View {
        VStack(spacing: 11){
            
            Text("Your Current Body Mass Index")
                .font(.subheadline)
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
                .padding(.horizontal)
                .padding(.vertical, 5)
                .background(Color.black)
                .cornerRadius(20)
        
            
            HStack(spacing: 27) {
         
                VStack {
                    Text("16.1")
                        .font(.title2.weight(.bold))
                        .foregroundColor(Color(hex: "#05FF00"))
                    
                    Text("BMI")
                        .font(.subheadline)
                        .foregroundColor(Color(hex: "#05FF00"))
                }
               
                
                Text("Amazing! A little bit more sweat and you will have a perfect BMI!")
                    .font(.footnote)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.leading)
                    .lineLimit(nil)
            }
        }
        .padding(.horizontal, 25).padding(.top, 0).padding(.bottom, 13)
        .background(Rectangle().fill(Color(red: 0.17, green: 0.17, blue: 0.17).opacity(0.5)).cornerRadius(30))
        .padding(.horizontal, 40)
    }
}

struct BMIDefinerView_Previews: PreviewProvider {
    static var previews: some View {
        BMIDefinerView()
    }
}
