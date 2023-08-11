//
//  SingleInfluencerPlan.swift
//  DesignScreens
//
//  Created by Aziz's MacBook Air on 03.08.2023.
//

import SwiftUI

struct InfluencerSinglePlan: View {
    
    var horizontalPadding: CGFloat = 11
    
    var body: some View {
        
        ZStack {
            
            Color("#050814")?.edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 10){
                
                HStack {
                    Text("Strength")
                        .foregroundColor(.white)
                        .font(.title.bold())
                    
                    Spacer()
                }
                .padding(.horizontal, horizontalPadding)
                
                HStack {
                    Text("“These plans range from intensive to fucking super intensive, ass-bursting workouts”")
                        .foregroundColor(Color("#9C9C9C"))
                        .font(.subheadline)
                    
                    Spacer()
                }
                .padding(.horizontal, horizontalPadding)
                
                UserPlanCardView()
                
            }
            
        }
        
    }
}

struct InfluencerMultiplePlans: View {
    
    var horizontalPadding: CGFloat = 11
    
    var body: some View {
        ZStack {
            
            Color("#050814")?.edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 10){
                
                
                HStack {
                    Text("Cardio")
                        .foregroundColor(.white)
                        .font(.title.bold())
                    
                    Spacer()
                }
                .padding(.horizontal, horizontalPadding)
                
                HStack {
                    Text("“These plans range from intensive to fucking super intensive, ass-bursting workouts”")
                        .foregroundColor(Color("#9C9C9C"))
                        .font(.subheadline)
                    
                    Spacer()
                }
                .padding(.horizontal, horizontalPadding)
                
                
                ScrollView(.horizontal, showsIndicators: false) {
                    
                    HStack(spacing: 25){
                        ForEach(0...7, id: \.self) { index in
                            SmallPlanCardView()
                        }
                    }
                    .padding(.horizontal, horizontalPadding)
                    
                }
                
                
            }
            
            
        }
    }
}

struct SmallPlanCardView: View {
    var body: some View {
        ZStack {
            Image("user_plans_card_back")
                .resizable(resizingMode: .stretch)
                .frame(width: 254, height: 254)
            
            HStack {
                Spacer()
                VStack {
                    Image("goga_image")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 212, height: 214)
                    //                        .padding(.trailing, -11)
                    Spacer()
                }
                .padding(.bottom, 90)
            }
            
            HStack {
                Spacer()
                    .frame(width: 16)
                
                VStack(alignment: .leading){
                    
                    Text("Muscular Start")
                        .foregroundColor(.white)
                        .font(.title2.bold())
                        .padding(.top, 40)
                        .frame(maxWidth: 120, alignment: .leading)
                    
                    Spacer()
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
            }
            .frame(height: 254)

            
            Button(action: {
                print("VIEW_PLAN")
            }, label: {
                Text("VIEW PLAN")
                    .shadow(color: .black, radius: 7, x: 0, y: 2)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 6)
                    .font(.headline.weight(.bold))
                    .foregroundColor(.white)
                    .background(Color(hex: "#04E000"))
                    .cornerRadius(10)
            })
            .padding(.horizontal, 16)
            .padding(.top, 185)
            .shadow(color: .black, radius: 7, x: 0, y: 2)
            
            HStack(spacing: 1){
                
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
            .padding(.leading, 16)

            HStack {
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 80, height: 26)
                    .background(Color(red: 0.03, green: 0.02, blue: 0.02).opacity(0.4))
                    .cornerRadius(10)
                    .overlay(
                        Text("5 weeks")
                            .foregroundColor(.white)
                            .font(.subheadline.bold())
                    )
                    .padding(.top, 45)
                    .padding(.leading, 16)
                
             Spacer()
            }
            
        }
      
    }
}

struct InfluencerSinglePlan_Previews: PreviewProvider {
    static var previews: some View {
        InfluencerMultiplePlans()
    }
}
