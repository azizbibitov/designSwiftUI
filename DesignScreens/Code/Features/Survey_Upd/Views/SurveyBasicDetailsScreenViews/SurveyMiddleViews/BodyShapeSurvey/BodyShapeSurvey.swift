//
//  BodyShapeSurvey.swift
//  DesignScreens
//
//  Created by Aziz's MacBook Air on 19.07.2023.
//

import SwiftUI

struct BodyShapeSurvey: View {
    
    @EnvironmentObject var basicSurveyVM: SurveyVM
    
    var maleBodyShapes: [String] = ["male_body_shape_good", "male_body_shape_medium", "male_body_shape_big"]
    
    var femaleBodyShapes: [String] = ["female_body_shape_good", "female_body_shape_medium", "female_body_shape_big"]
    
    @State private var currentIndex: Int = 0
    
    var bodyShapes: [String] {
        if basicSurveyVM.gender == .female {
            return femaleBodyShapes
        }else{
            return maleBodyShapes
        }
    }
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 30){
                Spacer()
                SnapCarousel(index: $currentIndex, items: bodyShapes) { imageName  in
                    VStack {
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 266, height: 199)
                            .background(Color(red: 0, green: 0, blue: 0))
                            .cornerRadius(20)
                            .overlay(
                                ZStack {
                                    RoundedRectangle(cornerRadius: 20)
                                        .inset(by: 0.5)
                                        .stroke(.white, lineWidth: 1)
                                    
                                    Image(imageName)
                                },
                                alignment: .center
                            )
                    }
                }
                .frame(height: 199)
                
                HStack(spacing: 20) {
                    ForEach((0..<3), id: \.self) { index in
                        Rectangle()
                            .fill(index == self.currentIndex ? Color(hex: "#05FF00") : Color(hex: "#9B9B9B"))
                            .frame(width: 60, height: 5)
                            .cornerRadius(5)
                        
                        
                    }
                }
                .padding(.vertical, 8)
                .padding(.horizontal, 10)
                .background(Color.white.opacity(0.18))
                .cornerRadius(10)
                
                HStack(spacing: 200){
                    
                    Text("Fit")
                        .foregroundColor(.white)
                        .font(.subheadline.bold())
                    
                    Text("Big")
                        .foregroundColor(.white)
                        .font(.subheadline.bold())
                }
                .padding(.top, -20)
                
                
                ApproximateBodyFatView()
                Spacer()
            }
        }
        .onDisappear {
            basicSurveyVM.bodyShapeIndex = currentIndex
        }
    }
    
}

struct ApproximateBodyFatView: View {
    
    var body: some View {
        VStack(spacing: 11){
            
            Text("Your Approximate Body Fat")
                .font(.subheadline)
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
                .padding(.horizontal)
                .padding(.vertical, 5)
                .background(Color.black)
                .cornerRadius(20)
        
            
            HStack(spacing: 27) {
         
                VStack {
                    Text("Good")
                        .font(.title2.weight(.bold))
                        .foregroundColor(Color(hex: "#00FF47"))
                    
                    Text("15% - 25%")
                        .font(.subheadline)
                        .foregroundColor(Color(hex: "#00FF47"))
                }
               
                
                Text("You are at a normal body for level! Try the personalized plan for you to get fitter and healthier")
                    .font(.footnote)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.leading)
                    .lineLimit(nil)
            }
        }
        .padding(.horizontal, 25).padding(.top, 0).padding(.bottom, 13)
        .background(Rectangle().fill(Color(red: 0.17, green: 0.17, blue: 0.17).opacity(0.5)).cornerRadius(30))
        .padding(.horizontal, 40)
    }
    
}

struct BodyShapeSurvey_Previews: PreviewProvider {
    static let basicSurveyVM = SurveyVM()
    static var previews: some View {
        BodyShapeSurvey()
            .environmentObject(basicSurveyVM)
    }
}



