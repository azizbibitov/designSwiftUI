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
    Goal(goalTitle: "Lose Weight", goalDescription: "This goal focuses on regular exercise to stimulate weight loss. Our progress trackers help monitor your journey towards a lighter, fitter you.", maleImage: "loseweight_male_image", femaleImage: "loseweight_female_image", goalIcon: "loseweight_icon", goalIndex: 1),
    Goal(goalTitle: "Build muscle", goalDescription: "This goal is designed for those aiming to gain lean muscle mass. It incorporates structured, high-intensity workout routines to fuel muscle growth.", maleImage: "buildmuscle_male_image", femaleImage: "buildmuscle_female_image", goalIcon: "buildmuscle_icon", goalIndex: 2),
    Goal(goalTitle: "Mental wellness", goalDescription: "A holistic approach towards mental health! This goal includes mindfulness activities, stress management techniques, and light exercise routines", maleImage: "mentalwellness_male_image", femaleImage: "mentalwellness_female_image", goalIcon: "mentalwellness_icon", goalIndex: 3),
    Goal(goalTitle: "Injury recovery", goalDescription: "I will guide you safely back to your regular activities, optimizing the recovery process and minimizing the risk of re-injury.", maleImage: "injuryrecovery_male_image", femaleImage: "injuryrecovery_female_image", goalIcon: "injuryrecovery_icon", goalIndex: 4),
]

