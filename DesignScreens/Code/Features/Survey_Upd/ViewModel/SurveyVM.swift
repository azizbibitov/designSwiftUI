//
//  SurveyVM.swift
//  DesignScreens
//
//  Created by Aziz's MacBook Air on 03.07.2023.
//

import Foundation
import SwiftUI

class SurveyVM: ObservableObject {
    
    @Published var progress: Int = 1
    @Published var nextEnabled: Bool = false
    @Published var userName: String = "Vmir"
    @Published var gender: Gender = .other
    @Published var birthday = Date()
    @Published var measureInFT: Bool = false
    @Published var heightInCM: Int = 250
    @Published var heightInFT: Double = 8.2
    @Published var measureInLB: Bool = false
    @Published var widthInKG: CGFloat = 30
    @Published var widthInLB: CGFloat = 61.0
    
    
    init() {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd"
        birthday = formatter.date(from: "1995/10/08") ?? Date()
    }
    
    var sectionSurveyCount: [Int] = [5, 6, 2]
    
    func getProgressPercentage(section: Int) -> CGFloat {
        switch section {
        case 0:
            if progress <= sectionSurveyCount[0] {
                return CGFloat(progress)/CGFloat(sectionSurveyCount[0])
            }else{
                return 1
            }
        case 1:
            if progress > sectionSurveyCount[1] + sectionSurveyCount[0] {
                return 1
            }else if progress > sectionSurveyCount[0] {
                return CGFloat(progress-sectionSurveyCount[0])/CGFloat(sectionSurveyCount[1])
            }else{
                return 0
            }
        case 2:
            if progress > sectionSurveyCount[1] + sectionSurveyCount[0] {
                return CGFloat(progress-sectionSurveyCount[0]-sectionSurveyCount[1])/CGFloat(sectionSurveyCount[2])
            }else{
                return 0
            }
        default: print("")
        }
        return withAnimation {
            CGFloat(sectionSurveyCount[section])/CGFloat(progress)
        }
    }
    
    func nextPressed() {
        if nextEnabled {
            nextSurvey()
        }
    }
    
    func nextSurvey(){
        if progress < sectionSurveyCount.reduce(0, +) { //Sum
            withAnimation {
                progress += 1
            }
        }
    }
    
    func prevSurvey(){
        if progress != 1 {
            withAnimation {
                progress -= 1
            }
        }
    }
    
    func checker() {
        switch progress {
        case 1:
            return nameChecker()
        case 2:
            nextEnabled = true
        case 3:
            birthdayChecker()
        case 4:
            nextEnabled = true
        case 5:
            nextEnabled = true
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
    
    func birthdayChecker() {
        nextEnabled = birthday != Date()
    }
    
}

// MARK: - Gender Survey
extension SurveyVM {
    var maleSelectedImage: String {
        if gender == .male {
            return "gender_selected"
        }else{
            return "gender_unselected"
        }
    }
    
    var femaleSelectedImage: String {
        if gender == .female {
            return "gender_selected"
        }else{
            return "gender_unselected"
        }
    }
    
    var maleImagescale: CGFloat {
        if gender == .male {
            return 1
        }else{
            return 0.8
        }
    }
    
    var femaleImagescale: CGFloat {
        if gender == .female {
            return 1
        }else{
            return 0.8
        }
    }
    
    func chooseMale(proxy: ScrollViewProxy) {
        withAnimation {
            if gender == .male {
                gender = .other
            }else{
                gender = .male
            }
            if gender == .male {
                proxy.scrollTo(1, anchor: .center)
            }else{
                proxy.scrollTo(3, anchor: .center)
            }
        }
    }
    
    func chooseFemale(proxy: ScrollViewProxy) {
        withAnimation {
            if gender == .female {
                gender = .other
            }else{
                gender = .female
            }
            if gender == .female {
                proxy.scrollTo(2, anchor: .center)
            }else{
                proxy.scrollTo(3, anchor: .center)
            }
        }
    }
    
    func chooseGenderOthers() {
        withAnimation {
            gender = .other
        }
        nextSurvey()
    }
}


// MARK: - Height Survey
extension SurveyVM {
    
}
