//
//  HomeNew.swift
//  DesignScreens
//
//  Created by Aziz's MacBook Air on 01.08.2023.
//

import SwiftUI

struct HomeNew: View {
    
    @EnvironmentObject var homeNewVM: HomeNewVM
    @Environment(\.safeAreaInsets) private var safeAreaInsets
    var body: some View {
        NavigationView {
            ZStack {
                Color("#050814")
                    .edgesIgnoringSafeArea(.all)
                ScrollView {
                    VStack(spacing: 25){
                        
                        HomeTopInfluencerView()
                        
                        HomeUserPlansView()
                        
                        HStack {
                            Text("Plans by Gogita Tupuriya")
                                .foregroundColor(Color("#939393"))
                                .font(.title3.bold())
                            
                            Spacer()
                        }
                        .padding(.horizontal, 11)
                        
                        
                        InfluencerSinglePlan()
                        
                        InfluencerMultiplePlans()
                        
                        
                    }
                    .padding(.top, safeAreaInsets.top)
                    .padding(.bottom, 85)
                }
                
            }
            .navigationBarHidden(true)
        }
    }
}

struct HomeTopInfluencerView: View {
    
    @State private var progress: Double = 0.4
    
    
    var body: some View {
        HStack(spacing: 11) {
            
            VStack(spacing: 8){
                
                
                NavigationLink(destination: InfluencerPage()){
                    Rectangle()
                        .foregroundColor(.clear)
                        .background(Color("#1C1E29"))
                        .cornerRadius(20)
                        .overlay(
                            HStack(spacing: 13){
                                Image("sample_image")
                                    .frame(width: 60, height: 60)
                                    .overlay(
                                        Circle()
                                            .stroke(Color(hex: "#00FF29"), lineWidth: 2)
                                    )
                                
                                VStack(alignment: .leading, spacing: 2){
                                    
                                    Text("Your coach")
                                        .font(.caption2)
                                        .foregroundColor(.white)
                                    
                                    HStack(spacing: 5){
                                        Text("Gogitatupuriya")
                                            .font(.subheadline)
                                            .foregroundColor(.white)
                                        
                                        Image("small_check")
                                            .frame(width: 13, height: 13)
                                    }
                                }
                                
                            }
                        )
                    
                }
                
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(height: 80)
                    .background(Color("#1C1E29"))
                    .cornerRadius(20)
                    .overlay(
                        HStack(spacing: 13){
                            Circle()
                                .inset(by: 2)
                                .stroke(Color(red: 0.39, green: 0.39, blue: 0.39), lineWidth: 5)
                                .foregroundColor(.clear)
                                .frame(width: 54, height: 54)
                                .overlay(
                                    VStack {
                                        Text("1:30")
                                            .foregroundColor(.white)
                                            .font(.subheadline.bold())
                                        
                                        Text("PM")
                                            .foregroundColor(.white)
                                            .font(.caption2.bold())
                                    }
                                )
                            VStack(alignment: .leading, spacing: 1){
                                Text("Fitness Lite")
                                    .foregroundColor(Color("#00FF1A"))
                                    .font(.subheadline.bold())
                                
                                Text("Upcoming workout")
                                    .foregroundColor(.white)
                                    .font(.caption2)
                            }
                        }
                    )
            }
            
            Rectangle()
                .foregroundColor(.clear)
                .frame(height: 160)
                .background(Color("#10131F"))
                .cornerRadius(20)
                .overlay(
                    VStack {
                        Text("Your progress")
                            .foregroundColor(.white)
                            .font(.caption2)
                        
                        HStack{
                            ZStack {
                                Circle()
                                    .inset(by: 2)
                                    .stroke(Color(red: 0.39, green: 0.39, blue: 0.39), lineWidth: 5)
                                    .foregroundColor(.clear)
                                    .frame(width: 55, height: 55)
                                
                                Circle()
                                    .inset(by: 2)
                                    .trim(from: 0, to: progress)
                                    .stroke(Color(red: 0, green: 1, blue: 0.16), lineWidth: 5)
                                    .rotationEffect(Angle(degrees: 180))
                                    .rotationEffect(.degrees(90))
                                    .frame(width: 55, height: 55)
                                
                                VStack(spacing: -2){
                                    Text("1")
                                        .foregroundColor(.white)
                                        .font(.title3.bold())
                                    
                                    Text("out of 3")
                                        .foregroundColor(.white)
                                        .font(.system(size: 9))
                                }
                                
                                
                            }
                            
                            Text("Completed  workouts")
                                .foregroundColor(.white)
                                .font(.caption)
                                .padding()
                                .multilineTextAlignment(.center)
                            
                            
                            
                            
                        }
                        
                        Button {
                            print("start_fitness_lite")
                        } label: {
                            Rectangle()
                                .foregroundColor(.clear)
                                .frame(width: 112, height: 28)
                                .background(Color("#00D121"))
                                .cornerRadius(8)
                                .overlay(
                                    Text("Start Fitness Lite")
                                        .font(.caption)
                                        .foregroundColor(.white)
                                )
                        }
                        
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 60, height: 13)
                            .background(Color(red: 0.85, green: 0.85, blue: 0.85).opacity(0.10))
                            .cornerRadius(10)
                            .overlay(
                                HStack(spacing: 10){
                                    ForEach(0...2, id: \.self) { index in
                                        Circle()
                                            .foregroundColor(index == 0 ? .white : Color(red: 0.85, green: 0.85, blue: 0.85).opacity(0.10))
                                            .frame(width: 5, height: 5)
                                    }
                                }
                            )
                    }
                )
            
        }
        .padding(.horizontal, 11)
    }
}



struct HomeNew_Previews: PreviewProvider {
    static var previews: some View {
        HomeNew()
    }
}


