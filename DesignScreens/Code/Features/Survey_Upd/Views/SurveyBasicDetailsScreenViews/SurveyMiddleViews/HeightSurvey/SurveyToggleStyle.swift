//
//  SurveyToggleStyle.swift
//  DesignScreens
//
//  Created by Aziz's MacBook Air on 08.07.2023.
//

import SwiftUI

struct SurveyToggleStyle: ToggleStyle {
    
    @State var unit1: String
    @State var unit2: String
    
    func makeBody(configuration: Configuration) -> some View {
        
        Rectangle()
            .foregroundColor(.clear)
            .frame(width: 144, height: 38)
            .cornerRadius(30)
            .overlay(
                RoundedRectangle(cornerRadius: 30)
                    .inset(by: 0.5)
                    .stroke(.white, lineWidth: 1)
                    .overlay(
                        ZStack {
                            Rectangle()
                                .foregroundColor(.clear)
                                .frame(width: 82, height: 38)
                                .background(Color(hex: "00E340"))
                                .cornerRadius(30)
                                .overlay(
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 30)
                                            .inset(by: 0.5)
                                            .stroke(.white, lineWidth: 1)
                                    }
                                    ,alignment: .center
                                )
                                .offset(x: configuration.isOn ? 31 : -31)
                            
                            Text(unit1)
                                .font(.title2.weight(.bold))
                                .foregroundColor(configuration.isOn ? Color.white : Color.black)
                                .offset(x: -31)
                            
                            Text(unit2)
                                .font(.title2.weight(.bold))
                                .foregroundColor(!configuration.isOn ? Color.white : Color.black)
                                .offset(x: 31)
                        }
                    )
            )
            .onTapGesture {
                withAnimation(.spring()) {
                    configuration.isOn.toggle()
                }
            }
    }
}

