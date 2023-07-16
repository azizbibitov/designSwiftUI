//
//  GoalsSurvey.swift
//  DesignScreens
//
//  Created by Aziz's MacBook Air on 15.07.2023.
//

import SwiftUI

struct GoalsSurvey: View {
    @EnvironmentObject var basicSurveyVM: SurveyVM
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 20){
                
                ForEach(0..<4) { id in
                    ExpandableGoalBtn(goal: goals[id])
                    Spacer()
                }
                
            }
            .padding(.vertical)
        }
        .onAppear {
            basicSurveyVM.checker()
        }
    }
}

struct GoalsSurvey_Previews: PreviewProvider {
    static let basicSurveyVM = SurveyVM()
    static var previews: some View {
        GoalsSurvey()
            .environmentObject(basicSurveyVM)
    }
}
