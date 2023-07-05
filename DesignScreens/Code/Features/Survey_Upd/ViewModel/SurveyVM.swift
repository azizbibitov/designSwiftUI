//
//  SurveyVM.swift
//  DesignScreens
//
//  Created by Aziz's MacBook Air on 03.07.2023.
//

import Foundation

class SurveyVM: ObservableObject {
    
    @Published var progress: Int = 1
    @Published var nextEnabled: Bool = false
    @Published var userName: String = "Vmir"
    
    var sectionSurveyCount: [Int] = [2, 6, 5] // in reversed order cause of ForEach iterating order
    
    func getProgressPercentage(section: Int) -> CGFloat {
        switch section {
        case 0:
            if progress <= sectionSurveyCount[2] {
                return CGFloat(progress)/CGFloat(sectionSurveyCount[2])
            }else{
                return 1
            }
        case 1:
            if progress > sectionSurveyCount[1] + sectionSurveyCount[2] {
                return 1
            }else if progress > sectionSurveyCount[2] {
                return CGFloat(progress-sectionSurveyCount[2])/CGFloat(sectionSurveyCount[1])
            }else{
                return 0
            }
        case 2:
            if progress > sectionSurveyCount[1] + sectionSurveyCount[2] {
                return CGFloat(progress-sectionSurveyCount[2]-sectionSurveyCount[1])/CGFloat(sectionSurveyCount[0])
            }else{
                return 0
            }
        default: print("")
        }
        return CGFloat(sectionSurveyCount[section])/CGFloat(progress)
    }
    
    func nextPressed() {
        if nextEnabled {
            nextSurvey()
        }
    }
    
    func nextSurvey(){
        if progress < sectionSurveyCount.reduce(0, +) { //Sum
            progress += 1
        }
    }
    
    func prevSurvey(){
        if progress != 1 {
            progress -= 1
        }
    }
    
    func checker() {
        switch progress {
        case 1:
            return nameChecker()
        default: print("")
        }
    }
    
    func nameChecker() {
        if userName != "" {
            nextEnabled = true
        }else{
            nextEnabled = false
        }
    }
    
}

