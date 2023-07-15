//
//  ExpandableGoalBtn.swift
//  DesignScreens
//
//  Created by Aziz's MacBook Air on 15.07.2023.
//

import SwiftUI

struct ExpandableGoalBtn: View {
    
    var goal: Goal
    
    @EnvironmentObject var basicSurveyVM: SurveyVM
    
    @State var humanImage: String = ""
    
    var body: some View {
        
        VStack(spacing: -Sizes.size(40)){
            
            
            ZStack(alignment: .bottomTrailing){
                
                Rectangle()
                    .foregroundColor(basicSurveyVM.selectedGoalIndex == goal.goalIndex ? Color(hex: "05FF00") : .clear)
                    .frame(maxWidth: .infinity, maxHeight: 100)
                    .cornerRadius(20)
                    .padding(.horizontal, 40)
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .inset(by: 0.5)
                            .stroke(Color(red: 0.47, green: 0.47, blue: 0.47), lineWidth: 1)
                            .padding(.horizontal, 40)
                    )
                
                
                
                Button(action: {
                    print("goalIndex: ", goal.goalIndex)
                    withAnimation{
                        basicSurveyVM.selectedGoalIndex = goal.goalIndex
                    }
                    
                }, label: {
                    
                    ZStack {
                        
                        
                        HStack{
                            
                            Text(goal.goalTitle)
                                .shadow(color: .black, radius: 5, x: 0, y: 5)
                                .font(.system(size: 25, weight: .bold))
                                .foregroundColor(Color.white)
                                .padding(.vertical, 35)
                                .padding(.leading, 25)
                            
                            
                            Spacer()
                        }
                    }
                    
                })
                .frame(maxWidth: .infinity, maxHeight: 100)
                .cornerRadius(20)
                .padding(.horizontal, 40)
                .buttonStyle(ScaleEffectButton())
                .zIndex(1)
                
                Image(humanImage)
                    .padding(.trailing, 40)
                    .onTapGesture {
                        withAnimation{
                            basicSurveyVM.selectedGoalIndex = goal.goalIndex
                        }
                    }
                
                
            }
            
            .zIndex(1)
            
            ZStack(alignment: .bottom){
                
                Color(hex: "252525")
                
                HStack (spacing: 24){
                    if basicSurveyVM.selectedGoalIndex == goal.goalIndex {
                        Image(goal.goalIcon)
                            .padding(.bottom, 12)
                            .padding(.leading, 24)
                        
                        Text(goal.goalDescription)
                            .font(.system(size: 13))
                            .foregroundColor(.white)
                            .padding(.bottom, 12)
                            .padding(.trailing, 6)
                    }
                }
                
                
            }
            .frame(height: basicSurveyVM.selectedGoalIndex == goal.goalIndex ? Sizes.size(200) : 0)
            .cornerRadius(30)
            .padding(.horizontal, 40)
         
            
        }
        
        
        
        .onAppear {
            humanImage = basicSurveyVM.gender == .female ? goal.femaleImage : goal.maleImage
        }
    }
    
    
}

struct ExpandableGoalBtn_Previews: PreviewProvider {
    static let basicSurveyVM = SurveyVM()
    static let goal = Goal(goalTitle: "Lose Weight", goalDescription: "This goal focuses on regular exercise to stimulate weight loss. Our progress trackers help monitor your journey towards a lighter, fitter you.", maleImage: "loseweight_male_image", femaleImage: "loseweight_female_image", goalIcon: "loseweight_icon", goalIndex: 0)
    static var previews: some View {
        ExpandableGoalBtn(goal: goal)
            .environmentObject(basicSurveyVM)
    }
}


