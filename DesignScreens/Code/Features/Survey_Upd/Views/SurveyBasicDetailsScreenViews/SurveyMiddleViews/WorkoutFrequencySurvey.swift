//
//  WorkoutFrequencySurvey.swift
//  DesignScreens
//
//  Created by Aziz's MacBook Air on 20.07.2023.
//

import SwiftUI

struct WorkoutFrequency {
    var image: String
    var title: String
    var description: String
    var frequency: Int
}

var workoutFrequencies: [WorkoutFrequency] = [
    WorkoutFrequency(image: "calendar_2", title: "2 times / week", description: "Works best for very busy schedules", frequency: 2),
    WorkoutFrequency(image: "calendar_3", title: "3 times / week", description: "I have free time, but not too much", frequency: 3),
    WorkoutFrequency(image: "calendar_4", title: "4 times / week", description: "Workout is an important part of my lifestyle", frequency: 4),
    WorkoutFrequency(image: "calendar_5", title: "5+ times / week", description: "I want to workout daily and get stronger faster!", frequency: 5),
]

struct WorkoutFrequencySurvey: View {
    
    @EnvironmentObject var basicSurveyVM: SurveyVM
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack {
                Spacer()
                TabView(selection: $basicSurveyVM.chosedWorkoutFrequencyIndex) {
                    ForEach(0..<4, id: \.self) { index in
                        VStack(spacing: 20){
                            
                            ZStack {
                                
                                Image(workoutFrequencies[index].image)
                                
                                HStack {
                                    Spacer()
                                        .frame(width: 245)
                                    
                                    Text("+")
                                        .foregroundColor(.white)
                                        .font(.system(size: 100))
                                        .padding(.top, 10)
                                }
                                .opacity(workoutFrequencies[index].frequency == 5 ? 1 : 0)
                                
                            }
                            
                            Text(workoutFrequencies[index].title)
                                .foregroundColor(Color(hex: "#05FF00"))
                                .font(.title.bold())
                                .multilineTextAlignment(.center)
                            
                            Text(workoutFrequencies[index].description)
                                .foregroundColor(Color.white)
                                .font(.subheadline)
                                .multilineTextAlignment(.center)
                                .padding(.horizontal, 40)
                            
                        }
                        
                    }
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                .frame(height: 310)
                
                Spacer()
                    .frame(height: 50)
                
                HStack(spacing: 64) {
                    ForEach((0..<4), id: \.self) { index in
                        
                        let size: CGFloat = index == self.basicSurveyVM.chosedWorkoutFrequencyIndex ? 21 : 14
                        
                        Image(index == self.basicSurveyVM.chosedWorkoutFrequencyIndex ? "bigger_ellipse" : "small_ellipse")
                            .resizable()
                            .scaledToFit()
                            .frame(width: size, height: size)
                            .onTapGesture {
                                withAnimation {
                                    basicSurveyVM.chosedWorkoutFrequencyIndex = index
                                }
                            }
                        
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
                    .frame(height: 9)
                
                HStack(spacing: 213){
                    
                    Text("Less")
                        .foregroundColor(.white)
                        .font(.subheadline.bold())
                    
                    Text("More")
                        .foregroundColor(.white)
                        .font(.subheadline.bold())
                }
                
                Spacer()
            }
        }
    }
}

struct WorkoutFrequencySurvey_Previews: PreviewProvider {
    static let basicSurveyVM = SurveyVM()
    static var previews: some View {
        WorkoutFrequencySurvey()
            .environmentObject(basicSurveyVM)
    }
}
