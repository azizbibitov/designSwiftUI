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
//                .padding(.horizontal, 11)
                
                HStack(spacing: 15) {
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
            
            Image("user_plans_card_back")
                .resizable()
                .frame(height: 315)
//                .padding(.horizontal, 5)
            
            HStack {
                Spacer()
                VStack {
                    Image("goga_image")
                    
                    //                        .padding(.trailing, -11)
                    Spacer()
                }
                .padding(.bottom, 75)
            }
            
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
            
            Button(action: {
                print("VIEW_PLAN")
            }, label: {
                Text("VIEW PLAN")
                    .shadow(color: .black, radius: 7, x: 0, y: 2)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 10)
                    .font(.title.weight(.bold))
                    .foregroundColor(.white)
                    .background(Color(hex: "#04E000"))
                    .cornerRadius(20)
            })
            .padding(.horizontal, 24)
            .padding(.top, 220)
            .shadow(color: .black, radius: 7, x: 0, y: 2)
            
            HStack(spacing: 10){
                
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 80, height: 26)
                    .background(Color(red: 0.03, green: 0.02, blue: 0.02).opacity(0.4))
                    .cornerRadius(10)
                    .overlay(
                        HStack(spacing: 6){
                            AntennaView(antenCount: 3)
                            Text("Strength")
                                .foregroundColor(.white)
                                .font(.caption)
                        }
                        
                    )
                
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 80, height: 26)
                    .background(Color(red: 0.03, green: 0.02, blue: 0.02).opacity(0.4))
                    .cornerRadius(10)
                    .overlay(
                        HStack(spacing: 6){
                            AntennaView(antenCount: 2)
                            Text("Cardio")
                                .foregroundColor(.white)
                                .font(.caption)
                        }
                        
                    )
                
                Spacer()
                
            }
            .padding(.top, 110)
            .padding(.leading, 24)
            
//            HStack {
//                Rectangle()
//                    .foregroundColor(.clear)
//                    .frame(width: 165, height: 63)
//                    .background(Color(red: 0.03, green: 0.02, blue: 0.02).opacity(0.4))
//                    .cornerRadius(10)
//                    .overlay(
//                        VStack(spacing: 3){
//                            Text("Weekly progress")
//                                .foregroundColor(.white)
//                                .font(.caption)
//                            HStack(spacing: 80){
//                                Text("1st week")
//                                    .foregroundColor(.white)
//                                    .font(.system(size: 8))
//
//                                Text("5th week")
//                                    .foregroundColor(.white)
//                                    .font(.system(size: 8))
//                            }
//
//                        }
//                    )
//
//                Spacer()
//            }
//            .padding(.top, -10)
//            .padding(.leading, 24)
            
            
        }
//        .padding(.horizontal, 5)
        .padding(.horizontal, 11)
        
    }
}


struct AntennaView: View {
    
    @State var antenCount: Int = 1
    
    var body: some View {
        HStack(alignment: .bottom, spacing: 2){
            
            Rectangle()
                .foregroundColor(antenCount > 0 ? Color("#05FF00") : Color("#D9D9D9"))
                .frame(width: 4, height: 6)
                .cornerRadius(20)
            
            Rectangle()
                .foregroundColor(antenCount > 1 ? Color("#05FF00") : Color("#D9D9D9"))
                .frame(width: 3, height: 8)
                .cornerRadius(20)
            
            Rectangle()
                .foregroundColor(antenCount > 2 ? Color("#05FF00") : Color("#D9D9D9"))
                .frame(width: 3, height: 10)
                .cornerRadius(20)
            
        }
    }
    
}

struct WeeklyProgress: View {
    var body: some View {
        HStack {
            
        }
    }
}

struct HomeUserPlansView_Previews: PreviewProvider {
    static var previews: some View {
        HomeUserPlansView()
    }
}
