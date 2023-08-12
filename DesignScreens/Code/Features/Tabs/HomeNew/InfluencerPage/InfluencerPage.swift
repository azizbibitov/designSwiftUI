//
//  InfluencerPage.swift
//  Example
//
//  Created by Aziz's MacBook Air on 09.08.2023.
//  Copyright © 2023 Tomoya Hirano. All rights reserved.
//

import SwiftUI

struct InfluencerPage: View {
    
    @Environment(\.safeAreaInsets) private var safeAreaInsets
    @EnvironmentObject var homeNewVM: HomeVM
    var body: some View {
        ZStack {
            Color(hex: "#050814")
                .ignoresSafeArea()
            
            ScrollView(.vertical, showsIndicators: false, content: {
                
                VStack {
                    InfluencerHeaderView()
                        .padding(.top, safeAreaInsets.top)
                    
                    InfluencerProfile()
                        .padding(.horizontal, 20)
                    
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        
                        HStack(spacing: 18){
                            ForEach(0...7, id: \.self) { index in
                                InfluencerVideoItem()
                            }
                        }
                        .padding(.horizontal, 20)
                        .padding(.top, 10)
                        .padding(.bottom, 18)
                        
                    }
                    
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(height: 1)
                        .background(Color("#363636"))
                        .padding(.horizontal, 20)
                    
                    HStack {
                        Text("Plans by Gogita Tupuriya")
                            .foregroundColor(Color("#939393"))
                            .font(.title3.bold())
                        
                        
                        
                        Spacer()
                    }
                    .padding(.horizontal, 20)
                    .padding(.top, 10)
                    
                    InfluencerSinglePlan(horizontalPadding: 20)
                    
                    InfluencerMultiplePlans(horizontalPadding: 20)
                    
                    Spacer()
                    
                    
                }
                .frame(width: UIScreen.screenWidth)
                .padding(.bottom, 85)
            })
            
            InfluencerOptionsView(isShowing: $homeNewVM.optionsShow)
        }
        
        .navigationBarBackButtonHidden()
        .navigationBarHidden(true)
    }
}

struct InfluencerVideoItem: View {
    
    var body: some View {
//        Button {
//            print("InfluencerVideoItem")
//        } label: {
        NavigationLink(destination: InfluencerVideoView()){
            ZStack {
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(height: 80)
                    .background(Color("#21263D"))
                    .cornerRadius(20)
                
                HStack(spacing: 17){
                    Image("sample_image")
                        .resizable()
                        .frame(width: 52, height: 52)
                        .overlay(
                            ZStack {
                                Circle()
                                    .fill(Color.black.opacity(0.75))
                                
                                Circle()
                                    .stroke(Color(hex: "#656565"), lineWidth: 2)
                                
                                Image("play_btn")
                            }
                        )
                    
                    VStack(alignment: .leading, spacing: 4){
                        Text("5 min")
                            .foregroundColor(.white)
                            .font(.caption2)
                        
                        Text("About me")
                            .foregroundColor(.white)
                            .font(.subheadline)
                    }
                }
                .padding(.horizontal)
            }
        }
    }
}

struct InfluencerProfile: View {
    var body: some View {
        VStack {
            HStack(spacing: 40){
                Image("sample_image")
                    .resizable()
                    .frame(width: 90, height: 90)
                    .overlay(
                        Circle()
                            .stroke(Color(hex: "#00FF29"), lineWidth: 2)
                    )
                
                HStack(spacing: 25){
                    VStack(alignment: .center){
                        Text("1")
                            .foregroundColor(.white)
                            .font(.subheadline.bold())
                        
                        Text("Plans")
                            .foregroundColor(.white)
                            .font(.caption2.weight(.light))
                    }
                    
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 1, height: 28)
                        .background(Color("#464646"))
                    
                    VStack(alignment: .center){
                        Text("25")
                            .foregroundColor(.white)
                            .font(.subheadline.bold())
                        
                        Text("Workouts")
                            .foregroundColor(.white)
                            .font(.caption2.weight(.light))
                    }
                    
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 1, height: 28)
                        .background(Color("#464646"))
                    
                    VStack(alignment: .center){
                        Text("10000")
                            .foregroundColor(.white)
                            .font(.subheadline.bold())
                        
                        Text("Followers")
                            .foregroundColor(.white)
                            .font(.caption2.weight(.light))
                    }
                    
                    
                }
            }
            .padding(.top, 15)
            .padding(.bottom, 4)
            
            HStack {
                Text("Gogita Tupuriya Sample")
                    .foregroundColor(.white)
                    .font(.subheadline.weight(.semibold))
                Spacer()
            }
            .padding(.bottom, 1)
            
            Text("An extraordinary fitness instructor that will make sure you reach your goals or he will spank your ass")
                .foregroundColor(.white)
                .font(.subheadline.weight(.light))
                .multilineTextAlignment(.leading)
        }
    }
}

struct InfluencerHeaderView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var homeNewVM: HomeVM
    
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
            
            HStack {
                Spacer()
                
                Button {
                    print("dots")
                    homeNewVM.optionsShow.toggle()
                } label: {
                    Image("dots")
                    
                }
                
                
            }
            .padding(.trailing, 20)
            
            HStack(spacing: 6){
                Text("Gogatupuriya")
                    .foregroundColor(.white)
                    .font(.title3.bold())
                
                Image("small_check2")
            }
            
            
        }
    }
}

struct Option: Hashable{
    var optionName: String
    var optionIcon: String
}

var optionsData: [Option] = [
    Option(optionName: "Share", optionIcon: "share_icon_new"),
    Option(optionName: "Notifications", optionIcon: "notification_icon_new"),
    Option(optionName: "Report", optionIcon: "report_icon_new"),
    Option(optionName: "Unfollow", optionIcon: "unfollow_icon_new"),
]


struct InfluencerOptionsView: View {
    
    @Binding var isShowing: Bool
    
    var body: some View {
        
        ZStack(alignment: .bottom) {
            
            if isShowing {
                Color.black
                    .opacity(0.3)
                    .ignoresSafeArea()
                    .onTapGesture {
                        withAnimation {
                            isShowing = false
                        }
                    }
                
                VStack(spacing: 0){
                    ForEach(0..<4, id: \.self) { index in
                        OptionItem(image: optionsData[index].optionIcon, optionTitle: optionsData[index].optionName, isColorRed: index > 1 ? true : false)
                            .listRowBackground(Color("#313131"))
                            .frame(height: 60)
                        
                        if index != 3 {
                            Rectangle()
                                .foregroundColor(.clear)
                                .frame(width: 429, height: 1)
                                .background(Color("#4A4A4A"))
                        }
                    }
                    
                   
                    
                }
                .padding(.top, 20)
                .padding(.bottom, 105)
                .frame(maxWidth: .infinity)
                .background(Color("#313131"))
                .cornerRadius(16, corners: .topLeft)
                .cornerRadius(16, corners: .topRight)
                .transition(.opacity.combined(with: .move(edge: .bottom)))
            }
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
        .ignoresSafeArea()
        .animation(.easeInOut, value: isShowing)
        
    }
}



struct OptionItem: View {
    var image: String = ""
    var optionTitle: String = ""
    var isColorRed: Bool = false
    
    var body: some View {
        Button {
            print(optionTitle)
        } label: {
            VStack {
                HStack(spacing: 13){
                    
                    Spacer()
                        .frame(width: 20)
                    
                    Image(image)
                        .renderingMode(.template)
                        .foregroundColor(isColorRed ? .red : .white)
                    
                    
                    Text(optionTitle)
                        .foregroundColor(isColorRed ? .red : .white)
                        .font(.title3)
                    
                    
                    Spacer()
                }
                
                
            }
        }

    }
}


struct InfluencerPage_Previews: PreviewProvider {
    static let basicSurveyVM = HomeVM()
    static var previews: some View {
        InfluencerPage()
            .environmentObject(basicSurveyVM)
//            .previewDevice(PreviewDevice(rawValue: DeviceName.iPhone_SE_3rd_generation.rawValue))
    }
}
