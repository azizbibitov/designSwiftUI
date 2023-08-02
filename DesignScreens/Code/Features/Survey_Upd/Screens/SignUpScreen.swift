//
//  SignUpScreen.swift
//  DesignScreens
//
//  Created by Aziz's MacBook Air on 21.07.2023.
//

import SwiftUI

struct SignUpScreen: View {
    
    @Environment(\.safeAreaInsets) private var safeAreaInsets
    @State var login: String = "vmir@gmail.com"
    @State var password: String = ""
    @EnvironmentObject var basicSurveyVM: SurveyVM
    var body: some View {
        ZStack {
            
            Color(hex: "#050813")
                .ignoresSafeArea()
            ScrollView(.vertical, showsIndicators: false) {
                
                VStack(spacing: 0){
                    
                    SurveyHeader()
                        .padding(.top, safeAreaInsets.top)
                    
                    Text("Finish Sign Up & Sync")
                        .foregroundColor(.white)
                        .font(.title.bold())
                        .padding(.top, 30)
                    
                    
                    ZStack {
                        
                        Image("KinesteX_sign_logo")
                        
                        HStack {
                            Rectangle()
                                .foregroundColor(.clear)
                                .frame(width: 98, height: 2)
                                .background(Color(hex: "#262626"))
                            
                            Spacer()
                            
                            Rectangle()
                                .foregroundColor(.clear)
                                .frame(width: 98, height: 2)
                                .background(Color(hex: "#262626"))
                        }
                        
                    }
                    .padding(.top, 14)
                    
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 45, height: 2)
                        .background(Color(hex: "#262626"))
                        .rotationEffect(Angle(degrees: -90))
                        .padding(.top, 30)
                    
                    HStack {
                        Image("user").foregroundColor(.white)
                            .padding(.leading, 11)
                        TextField("", text: $login)
                            .foregroundColor(Color.white)
                            .font(Font.system(size: 12, weight: .medium))
                            .placeholder(when: login.isEmpty, placeholder: {
                                Text("gmail")
                                    .foregroundColor(Color(hex: "#505050"))
                                    .font(Font.system(size: 12, weight: .medium))
                            })
                            .padding(.leading, 9)
                            .padding(.vertical)
                    }
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color(hex: "#262626"))
                    )
                    .padding(.horizontal, 55)
                    .padding(.top, 22)
                    
                    
                    SecureInputView("Password", text: $password)
                        .padding(.top, 30)
                    
                    Button(action: {
                        print("Sign up")
                    }, label: {
                        Text("Sign up")
                            .shadow(color: .black, radius: 7, x: 0, y: 2)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 10)
                            .font(.title2.weight(.bold))
                            .foregroundColor(.white)
                            .background(Color(hex: "#04E000"))
                            .cornerRadius(10)
                    })
                    .padding(.horizontal, 56)
                    .padding(.top, 47)
                    
                    
                    HStack (spacing: 9){
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(height: 1)
                            .background(Color(hex: "#878787"))
                        Text("Sign up with")
                            .font(Font.custom("Arial", size: 18))
                            .lineLimit(1)
                            .scaledToFill()
                            .foregroundColor(Color(hex: "#878787"))
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(height: 1)
                            .background(Color(hex: "#878787"))
                    }
                    .padding(.top, 30)
                    
                    HStack(spacing: 115){
                        
                        Button {
                            print("sign in with google")
                        } label: {
                            Circle()
                                .fill(Color(hex: "#262626"))
                                .frame(width: 48, height: 48)
                                .overlay(
                                    Image("google_icon")
                                )
                        }
                        
                        Button {
                            print("sign in with apple")
                        } label: {
                            Circle()
                                .fill(Color(hex: "#262626"))
                                .frame(width: 48, height: 48)
                                .overlay(
                                    Image("apple_icon")
                                )
                        }
                        
                        
                    }
                    .padding(.top, 30)
                    
                    if #available(iOS 15, *) {
                        iOS15LinksView()
                    } else {
                        LinksView()
                    }
                    
                }
            }
            
        }
        .edgesIgnoringSafeArea(.all)
        .onTapGesture {
            hideKeyboard()
        }
    }
}

struct SignUpScreen_Previews: PreviewProvider {
    static let basicSurveyVM = SurveyVM()
    static var previews: some View {
        SignUpScreen()
            .environmentObject(basicSurveyVM)
            .previewDevice(PreviewDevice(rawValue: DeviceName.iPhone_11_Pro_Max.rawValue))
    }
}
