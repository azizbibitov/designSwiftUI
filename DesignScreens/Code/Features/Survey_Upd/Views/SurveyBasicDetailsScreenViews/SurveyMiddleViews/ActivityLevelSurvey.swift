//
//  ActivityLevelSurvey.swift
//  DesignScreens
//
//  Created by Aziz's MacBook Air on 20.07.2023.
//

import SwiftUI

struct ActivityLevel: Hashable{
    var image: String
    var title: String
    var description: String
}

var activityLevels: [ActivityLevel] = [
    ActivityLevel(image: "moderately_active", title: "Moderately Active", description: "I engage in moderate exercise or sports 3-5 days a week. "),
    ActivityLevel(image: "lightly_active", title: "Lightly Active", description: "I engage in light exercise (including walking) or sports 1-3 days a week."),
    ActivityLevel(image: "sedentary", title: "Sedentary", description: "My lifestyle mostly involves sitting, either for work or leisure."),
    ActivityLevel(image: "very_active", title: "Very Active", description: "I engage in hard exercise or sports 6-7 days a week. "),
]

struct ActivityLevelSurvey: View {
    
    @EnvironmentObject var basicSurveyVM: SurveyVM
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack {
                Spacer()
                TabView(selection: $basicSurveyVM.activityLevelIndex) {
                    ForEach(0..<4, id: \.self) { index in
                        VStack(spacing: 20){
                            
                            Image(activityLevels[index].image)
                            
                            Text(activityLevels[index].title)
                                .foregroundColor(Color(hex: "#05FF00"))
                                .font(.title.bold())
                                .multilineTextAlignment(.center)
                            
                            Text(activityLevels[index].description)
                                .foregroundColor(Color.white)
                                .font(.subheadline)
                                .multilineTextAlignment(.center)
                                .padding(.horizontal, 40)
                            
                        }
                        
                    }
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                .frame(height: 420)
                
                Spacer()
                    .frame(height: 50)
                
                HStack(spacing: 64) {
                    ForEach((0..<4), id: \.self) { index in
                        
                        let size: CGFloat = index == self.basicSurveyVM.activityLevelIndex ? 21 : 14
                        
                        Image(index == self.basicSurveyVM.activityLevelIndex ? "bigger_ellipse" : "small_ellipse")
                            .resizable()
                            .scaledToFit()
                            .frame(width: size, height: size)
                        
                    }
                }
                .background(
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 298, height: 32)
                        .background(Color(red: 0.27, green: 0.27, blue: 0.27))
                        .cornerRadius(20)
                )
                
                Spacer()
            }
        }
    }
}

struct ActivityLevelSurvey_Previews: PreviewProvider {
    static let basicSurveyVM = SurveyVM()
    static var previews: some View {
        ActivityLevelSurvey()
            .environmentObject(basicSurveyVM)
    }
}
