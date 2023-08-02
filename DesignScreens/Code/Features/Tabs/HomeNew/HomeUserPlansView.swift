//
//  HomeUserPlansView.swift
//  DesignScreens
//
//  Created by Aziz's MacBook Air on 02.08.2023.
//

import SwiftUI

struct HomeUserPlansView: View {
    
    @State private var index = 0
    
    var body: some View {
        ZStack {
            
            Color("#050814")
                .edgesIgnoringSafeArea(.all)
            
                HStack {
                    Text("Your plans")
                        .foregroundColor(Color("#939393"))
                        .font(.title3.bold())
                    
                    Spacer()
                }
                .padding(.bottom, 380)
                .padding(.horizontal, 11)
                
                TabView(selection: $index) {
                    ForEach((0..<3), id: \.self) { index in
                        UserPlanCardView()
                    }
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                .frame(height: 355)
                .padding(.horizontal, 11)
                
                HStack(spacing: 7) {
                    ForEach((0..<3), id: \.self) { index in
                        Circle()
                            .fill(index == self.index ? Color.white : Color(red: 0.85, green: 0.85, blue: 0.85).opacity(0.10))
                            .frame(width: 5, height: 5)

                    }
                }
                .padding(.vertical, 5)
                .padding(.horizontal, 12)
                .background(Color(red: 0.85, green: 0.85, blue: 0.85).opacity(0.1))
                .cornerRadius(10)
                .padding()
                .padding(.top, 360)
            
        }
        
    }
}

struct UserPlanCardView: View {
    var body: some View {
        ZStack {
            ZStack {
                
                Image("user_plans_card_back")
                    .resizable()
                    .frame(height: 315)
                    .padding(.horizontal, 5)
                
                HStack {
                    VStack {
                        Text("Muscular Start")
                            .foregroundColor(.white)
                            .font(.title.bold())
                            .padding(.horizontal, 25)
                            .padding(.top, 40)
                        
                        Spacer()
                    }
                    
                    Spacer()
                }
                .frame(height: 315)
                
                
            }
            HStack {
                Spacer()
                VStack {
                    Image("goga_image")
//                        .padding(.trailing, -11)
                    Spacer()
                }
                .padding(.bottom, 75)
            }
        }
    }
}

struct HomeUserPlansView_Previews: PreviewProvider {
    static var previews: some View {
        HomeUserPlansView()
    }
}
