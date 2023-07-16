//
//  GoalModel.swift
//  DesignScreens
//
//  Created by Aziz's MacBook Air on 15.07.2023.
//

import Foundation

struct Goal {
    
    var goalTitle: String
    var goalDescription: String
    var maleImage: String
    var femaleImage: String
    var goalIcon: String
    var goalIndex: Int
    
}


var goals = [
    Goal(goalTitle: "lose_weight".localizable, goalDescription: "lose_weight_desc".localizable(), maleImage: "loseweight_male_image", femaleImage: "loseweight_female_image", goalIcon: "loseweight_icon", goalIndex: 1),
    Goal(goalTitle: "build_muscle".localizable, goalDescription: "build_muscle_desc".localizable(), maleImage: "buildmuscle_male_image", femaleImage: "buildmuscle_female_image", goalIcon: "buildmuscle_icon", goalIndex: 2),
    Goal(goalTitle: "mental_wellness".localizable, goalDescription: "mental_wellness_desc".localizable, maleImage: "mentalwellness_male_image", femaleImage: "mentalwellness_female_image", goalIcon: "mentalwellness_icon", goalIndex: 3),
    Goal(goalTitle: "injury_recovery".localizable, goalDescription: "injury_recovery_desc".localizable, maleImage: "injuryrecovery_male_image", femaleImage: "injuryrecovery_female_image", goalIcon: "injuryrecovery_icon", goalIndex: 4),
]
