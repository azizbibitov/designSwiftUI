//
//  PersonalAccountView.swift
//  Example
//
//  Created by Aziz's MacBook Air on 17.08.2023.
//  Copyright © 2023 Kinda Smart Inc. All rights reserved.
//

import SwiftUI

struct PersonalAccountView: View {
    @Environment(\.safeAreaInsets) private var safeAreaInsets
    var body: some View {
        ZStack {
            Color(hex: "#050814")
                .ignoresSafeArea()
            
            ScrollView(.vertical, showsIndicators: false, content: {
                
                VStack {
                    
                    PersonalAccountHeaderView()
                        .padding(.top, safeAreaInsets.top)
                        .padding(.bottom, 15)
                    
                   
                    ParametrsView(parametrViews: [
                        PropertyValue(parametr: "Followers", value: "10000"),
                        PropertyValue(parametr: "Plans", value: "1"),
                        PropertyValue(parametr: "Workouts", value: "25")
                    ])
                    
                    
                    ParametrsView(parametrViews: [
                        PropertyValue(parametr: "Clicked number", value: "100"),
                        PropertyValue(parametr: "Downloaded the app", value: "70")
                    ])
                    
                    ParametrsView(parametrViews: [
                        PropertyValue(parametr: "Sign ups", value: "50"),
                        PropertyValue(parametr: "Men", value: "25"),
                        PropertyValue(parametr: "Women", value: "25")
                    ])
                    
                    ParametrsView(parametrViews: [
                        PropertyValue(parametr: "12-20 age", value: "10"),
                        PropertyValue(parametr: "21-35 age", value: "25"),
                        PropertyValue(parametr: "35+ age", value: "15")
                    ])
                    
                    ParametrsView(parametrViews: [
                        PropertyValue(parametr: "Did a workout", value: "45"),
                        PropertyValue(parametr: "Most popular workout:", value: "Fitness Lite")
                    ])
                    
                    ParametrsView(parametrViews: [
                        PropertyValue(parametr: "Bought subscription", value: "10")
                    ], isLast: true)
                    
                }
                
            })
            
        }
        .navigationBarBackButtonHidden()
        .navigationBarHidden(true)
    }
}

struct ParametrsView: View {
    
    var parametrViews: [PropertyValue] = []
    var isLast: Bool = false
    
    var body: some View {
        VStack(spacing: 15){
            ForEach(0..<parametrViews.count, id: \.self) { index in
                parametrViews[index]
            }
        }
        .padding(.horizontal, 15)
        .padding(.vertical, 13)
        .background(
            Rectangle()
                .foregroundColor(.clear)
                .background(Color("#141E26"))
                .cornerRadius(20)
        )
        .padding(.horizontal, 15)
        .padding(.top, 3)
        
        Rectangle()
            .foregroundColor(.clear)
            .frame(height: 1)
            .background(Color("#363636"))
            .padding(.horizontal, 30)
            .padding(.top, 3)
            .isHidden(isLast)
    }
}


struct PropertyValue: View {
    
    var parametr: String = ""
    var value: String = ""
    
    var body: some View {
        HStack {
            Text(parametr)
                .foregroundColor(.white)
                .font(.title3.bold())
            
            Spacer()
            
            Text(value)
                .foregroundColor(Color("#42FF00"))
                .font(.title3.bold())
        }
    }
}


struct PersonalAccountHeaderView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack {
            
            HStack {
                Button {
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Image("arrow-right")
                    
                }
                
                Spacer()
            }
            .padding(.leading, 20)
            
            
            HStack(spacing: 6){
                Text("Personal account")
                    .foregroundColor(.white)
                    .font(.title2.bold())
            }
            
            
        }
    }
}

struct PersonalAccountView_Previews: PreviewProvider {
    static var previews: some View {
        PersonalAccountView()
    }
}
