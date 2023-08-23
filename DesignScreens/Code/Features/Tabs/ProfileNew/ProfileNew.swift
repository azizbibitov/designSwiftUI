//
//  ProfileNew.swift
//  DesignScreens
//
//  Created by Aziz's MacBook Air on 01.08.2023.
//

import SwiftUI

struct ProfileNew: View {
    
    @Environment(\.safeAreaInsets) private var safeAreaInsets
    
    var body: some View {
        ZStack {
            
            Color("#050814")
                .edgesIgnoringSafeArea(.all)
            
            ScrollView(.vertical, showsIndicators: false, content: {
                
                VStack {
                    
                    ProfileHeader()
                        .padding(.top, safeAreaInsets.top)
                    
                    ProfileCredentials()
                    
                    Rectangle() // Divider
                        .foregroundColor(.clear)
                        .frame(height: 1)
                        .background(Color("#363636"))
                        .padding(.top, 30)
                        .padding(.horizontal, 30)
                    
                    DailyStatisticsSection()
                    
                    MonthlyStatsSection()
                    
                    WorkoutActivitySection()
                }
                .padding(.bottom, 85)
            })
            .ignoresSafeArea()
            
        }
    }
    
}



struct ProfileHeader: View {
    var body: some View {
        ZStack {
            
            topRightIcons
            
            centeredNameAndLocationView
            
            profileLeftImage
            
        }
        .padding(.horizontal, 10)
    }
    
    var topRightIcons: some View {
        
        VStack {
            
            HStack(spacing: 20){
                
                Spacer()
                
                Button {
                    
                } label: {
                    Image("personal_account_icon")
                }
                
                Button {
                    
                } label: {
                    Image("settings_icon")
                }
                
            }
            
            Spacer()
        }
        
    }
    
    var centeredNameAndLocationView: some View {
        VStack(alignment: .center){
            
            VStack(spacing: 4){
                
                Text("Perman Annamammedov")
                    .foregroundColor(.white)
                    .font(.title3.bold())
                    .frame(maxWidth: 170)
                    .multilineTextAlignment(.center)
                
                HStack {
                    Image("location_small_icon")
                    Text("Ashgabat, Turkmenistan")
                        .foregroundColor(.white)
                        .font(.caption)
                }
                
            }
            .frame(height: 80)
            .padding(.top, 20)
            
            Spacer()
            
        }
    }
    
    var profileLeftImage: some View {
        VStack {
            
            HStack {
                
                Button {
                    print("profile_image")
                } label: {
                    ZStack(alignment: .bottomTrailing){
                        Image("sample_image")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 80, height: 80)
                            .clipShape(Circle())
                            .overlay(
                                Circle()
                                    .stroke(Color(hex: "#00FF29"), lineWidth: 2)
                            )
                        
                        Circle()
                            .foregroundColor(Color("#00FF29"))
                            .frame(width: 27, height: 27)
                            .overlay(
                                Image("plus_svg")
                            )
                    }
                }
                
                
                
                
                Spacer()
                
                
            }
            .padding(.top, 20)
            
            
            
            
            
            Spacer()
        }
    }
}

struct ProfileCredentials: View {
    var body: some View {
        HStack {
            UserCredentialItem(iconName: "weight_small_icon", credentialName: "Height", value: "165.0 CM")
            Spacer()
            UserCredentialItem(iconName: "weight_small_icon", credentialName: "Weight", value: "72 KG")
            Spacer()
            UserCredentialItem(iconName: "age_small_icon", credentialName: "Age", value: "27.5 Year")
        }
        .padding(.top, 20)
        .padding(.horizontal, 25)
    }
}

struct UserCredentialItem: View {
    var iconName: String = ""
    var credentialName: String = ""
    var value: String = ""
    var body: some View {
        HStack {
            Image(iconName)
            VStack(alignment: .leading){
                Text(value)
                    .foregroundColor(.white)
                    .font(.caption)
                Text(credentialName)
                    .foregroundColor(Color("#EBEBF5")?.opacity(0.6))
                    .font(.caption)
            }
        }
    }
}

struct ProfileNew_Previews: PreviewProvider {
    static var previews: some View {
        ProfileNew()
    }
}
