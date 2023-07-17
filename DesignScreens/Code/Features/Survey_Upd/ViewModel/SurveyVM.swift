//
//  SurveyVM.swift
//  DesignScreens
//
//  Created by Aziz's MacBook Air on 03.07.2023.
//

import Foundation
import SwiftUI

class SurveyVM: ObservableObject {
    
    /// Screen Progresses
    ///  3 - SurveySecondOnboardingScreen
    ///  4 - BasicDetailsLaunchScreen
    ///  5 - SurveysScreen
    ///  6 - LifestyleAndGoalsLaunchScreen
   
    /// Survey Progresses
    /// 1 - Name
    /// 2 - Gender
    /// 3 - Birthday
    /// 4 - Height
    /// 5 - Width
    /// 6 - Goals
    
    @Published var screensProgress: Int = 5
    @Published var isBack: Bool = false
    @Published var surveyProgress: Int = 5
    @Published var nextEnabled: Bool = false
    @Published var userName: String = "Vmir"
    @Published var gender: Gender = .other
    @Published var birthday = Date()
    @Published var measureInFT: Bool = false
    @Published var heightInCM: Int = 170
    @Published var heightInFT: Int = 5
    @Published var heightInFTInch: Int = 7
    @Published var measureInLB: Bool = false
    @Published var weightInKG: CGFloat = 50
    @Published var weightInLB: CGFloat = 100.0
    @Published var selectedGoalIndex: Int = 0
    
    
    init() {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd"
        birthday = formatter.date(from: "1995/10/08") ?? Date()
    }
    
    var sectionSurveyCount: [Int] = [5, 6, 2]
    
    func getProgressPercentage(section: Int) -> CGFloat {
        switch section {
        case 0:
            if surveyProgress <= sectionSurveyCount[0] {
                return CGFloat(surveyProgress)/CGFloat(sectionSurveyCount[0])
            }else{
                return 1
            }
        case 1:
            if surveyProgress > sectionSurveyCount[1] + sectionSurveyCount[0] {
                return 1
            }else if surveyProgress > sectionSurveyCount[0] {
                return CGFloat(surveyProgress-sectionSurveyCount[0])/CGFloat(sectionSurveyCount[1])
            }else{
                return 0
            }
        case 2:
            if surveyProgress > sectionSurveyCount[1] + sectionSurveyCount[0] {
                return CGFloat(surveyProgress-sectionSurveyCount[0]-sectionSurveyCount[1])/CGFloat(sectionSurveyCount[2])
            }else{
                return 0
            }
        default: print("")
        }
        return withAnimation {
            CGFloat(sectionSurveyCount[section])/CGFloat(surveyProgress)
        }
    }
    
    func iamReadyBtnClick() {
        isBack = false
        screensProgress = 4
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5){
            self.screensProgress = 5
        }
    }
    
    func nextPressed() {
        if nextEnabled {
            
            switch surveyProgress {
            case 5:
                screensProgress = 6
                self.nextSurvey()
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5){
                    self.screensProgress = 5
                }
            default:
                nextSurvey()
            }
            
            
          
        }
    }
    
    func nextSurvey(){
        if surveyProgress < sectionSurveyCount.reduce(0, +) { //Sum
            withAnimation {
                surveyProgress += 1
            }
        }
    }
    
    func prevSurvey(){
        if surveyProgress != 1 {
            withAnimation {
                surveyProgress -= 1
            }
        }else{
            screensProgress = 3
            isBack = true
        }
        checker()
    }
    
    func checker() {
        switch surveyProgress {
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
    
    func heightRulerCMInOnAppear(_ scrollView: UIScrollView, rulerHeight: inout CGFloat) {
        rulerHeight = scrollView.contentSize.height - scrollView.frame.height
        let unit = rulerHeight/150.1
        let defaultScrollTo: CGFloat = CGFloat(250 - heightInCM) * unit
        scrollView.contentOffset.y = defaultScrollTo
    }
    
    func heightRulerFTInOnAppear(_ scrollView: UIScrollView, rulerHeight: inout CGFloat) {
        rulerHeight = scrollView.contentSize.height - scrollView.frame.height
        let unit = rulerHeight/60
        
        if heightInFT < 4 {
            scrollView.contentOffset.y = 50*unit + CGFloat(10-heightInFTInch)*unit
        }else if heightInFT < 5 {
            scrollView.contentOffset.y = 38*unit + CGFloat(12-heightInFTInch)*unit
        }else if heightInFT < 6 {
            scrollView.contentOffset.y = 26*unit + CGFloat(12-heightInFTInch)*unit
        }else if heightInFT < 7 {
            scrollView.contentOffset.y = 14*unit + CGFloat(12-heightInFTInch)*unit
        }else if heightInFT < 8 {
            scrollView.contentOffset.y = 2*unit + CGFloat(12-heightInFTInch)*unit
        }else {
            scrollView.contentOffset.y = CGFloat(2-heightInFTInch)*unit
        }
        
        
    }
    
    func weightRulerKGInOnAppear(_ scrollView: UIScrollView, scrollContentWidth: CGFloat) {
        print("scrollContentWidth: ",  scrollContentWidth)
        let unit = scrollContentWidth/220
        let defaultScrollTo: CGFloat = CGFloat(weightInKG - 30) * unit
        scrollView.contentOffset.x = defaultScrollTo + 300
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


