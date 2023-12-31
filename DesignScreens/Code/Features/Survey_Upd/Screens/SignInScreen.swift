//
//  SignInScreen.swift
//  DesignScreens
//
//  Created by Aziz's MacBook Air on 20.07.2023.
//

import SwiftUI

struct SignInScreen: View {
    
    @State var login: String = "vmir@gmail.com"
    @State var password: String = ""
    @EnvironmentObject var basicSurveyVM: SurveyVM
    var body: some View {
        ZStack {
            
            Color(hex: "#050813")
                .ignoresSafeArea()
            
            ScrollView(.vertical, showsIndicators: false) {
                
                VStack(spacing: 0){
                    
                    
                    HStack {
                        Button {
                            hideKeyboard()
                            basicSurveyVM.screensProgress = 2
                            basicSurveyVM.isBack = true
                        } label: {
                            Image("arrow-right")
                            
                        }
                        
                        Spacer()
                    }
                    .padding(.leading, 20)
                    .padding(.top, 20)
                    
                    Text("Sign in")
                        .foregroundColor(.white)
                        .font(.title.bold())
                        .padding(.bottom, 14)
                    
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
                        print("Sign in")
                        basicSurveyVM.signInBtnClick()
                    }, label: {
                        Text("Sign in")
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
                        Text("Sign in with")
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

struct SecureInputView: View {
    
    @Binding private var text: String
    @State private var isSecured: Bool = true
    private var title: String
    
    init(_ title: String, text: Binding<String>) {
        self.title = title
        self._text = text
    }
    
    var body: some View {
        ZStack(alignment: .trailing) {
            Group {
                if isSecured {
                    HStack {
                        Image("lock").foregroundColor(.white)
                            .padding(.leading, 11)
                        SecureField("", text: $text)
                            .foregroundColor(Color.white)
                            .font(Font.system(size: 12, weight: .medium))
                            .placeholder(when: text.isEmpty, placeholder: {
                                Text(title)
                                    .foregroundColor(Color(hex: "#505050"))
                                    .font(Font.system(size: 12, weight: .medium))
                            })
                            .padding(.leading, 9)
                            .padding(.vertical)
                    }
                } else {
                    HStack {
                        Image("lock").foregroundColor(.white)
                            .padding(.leading, 11)
                        TextField(title, text: $text)
                            .foregroundColor(Color.white)
                            .font(Font.system(size: 12, weight: .medium))
                            .placeholder(when: text.isEmpty, placeholder: {
                                Text(title)
                                    .foregroundColor(Color(hex: "#505050"))
                                    .font(Font.system(size: 12, weight: .medium))
                            })
                            .padding(.leading, 9)
                            .padding(.vertical)
                    }
                }
            }.padding(.trailing, 32)

            Button(action: {
                isSecured.toggle()
            }) {
                Image(systemName: self.isSecured ? "eye.slash" : "eye")
                    .accentColor(.gray)
                    .padding(.trailing, 15)
            }
        }
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(Color(hex: "#262626"))
        )
        .padding(.horizontal, 55)
    }
}

@available(iOS 15, *)
struct iOS15LinksView: View {
    
    @State var string1 = AttributedString("By continuing, you agree to our ")
    @State var termsOfServiceText = AttributedString("Terms of Service")
    @State var string2 = AttributedString(" and acknowledge that you have read our ")
    @State var privacyPolicyText = AttributedString("Privacy Policy")
    @State var string3 = AttributedString(" to learn how we collect and use your data.")
    
    var body: some View {
        Text(string1)
            .foregroundColor(.white)
            .font(.subheadline)
            .multilineTextAlignment(.center)
            .padding(.top, 30)
            .padding(.horizontal, 14)
            .onAppear {
                termsOfServiceText.link = URL(string: "https://www.apple.com/")
                termsOfServiceText.foregroundColor = Color(hex: "#00FF38")
                
                privacyPolicyText.link = URL(string: "https://www.google.com/")
                privacyPolicyText.foregroundColor = Color(hex: "#00FF38")
                
                string1.append(termsOfServiceText)
                string1.append(string2)
                string1.append(privacyPolicyText)
                string1.append(string3)
            }
    }
    
}

struct LinksView: View {
    var body: some View {
        VStack(spacing: 0){
            HStack(spacing: 0){
                Text("By continuing, you agree to our ")
                Text("Terms of Service")
                    .font(.subheadline.bold())
                    .foregroundColor(Color(hex: "#00FF38"))
                    .onTapGesture {
                        UIApplication.shared.open(URL(string: "https://www.apple.com/")!)
                    }
            }
           Text(" and acknowledge that you have read our ")
            HStack(spacing: 0){
     
                Text("Privacy Policy")
                    .font(.subheadline.bold())
                    .foregroundColor(Color(hex: "#00FF38"))
                    .onTapGesture {
                        UIApplication.shared.open(URL(string: "https://www.google.com/")!)
                    }
                Text(" to learn how we collect")
            }
            Text(" and use your data.")
        }
        .foregroundColor(.white)
        .font(.subheadline)
        .multilineTextAlignment(.center)
        .padding(.top, 30)
        .padding(.horizontal, 14)
    }
    
}

struct SignInScreen_Previews: PreviewProvider {
    static let basicSurveyVM = SurveyVM()
    static var previews: some View {
        SignInScreen()
            .environmentObject(basicSurveyVM)
            .previewDevice(PreviewDevice(rawValue: DeviceName.iPhone_X.rawValue))
    }
}
