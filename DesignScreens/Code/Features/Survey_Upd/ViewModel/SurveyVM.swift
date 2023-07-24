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
    /// 1 - SignInScreen
    /// 2 - SurveyFirstOnboardingScreen
    /// 3 - SurveySecondOnboardingScreen
    /// 4 - BasicDetailsLaunchScreen
    /// 5 - SurveysScreen
    /// 6 - LifestyleAndGoalsLaunchScreen
    /// 7 - RoutinesAndSyncLaunchScreen
    /// 8 - SignUpScreen
    
    /// Survey Progresses
    /// 1 - Name
    /// 2 - Gender
    /// 3 - Birthday
    /// 4 - Height
    /// 5 - Width
    /// 6 - Goals
    /// 7 - Focus Areas
    /// 8 - Current Body Shape
    /// 9 - Physical Pain Experience
    /// 10 - Diagnose
    /// 11 - Activity Level
    /// 12 - Workout frequency
    
    @Published var screensProgress: Int = 2
    @Published var isBack: Bool = false
    @Published var surveyProgress: Int = 1
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
    @Published var selectedGoalIndex: Int = 1
    @Published var selectedFocusAreas: [FocusArea] = []
    @Published var bodyShapeIndex: Int = 0
    @Published var hasPainExperience: Bool = false
    @Published var diagnosesString: [String] = []
    @Published var otherDiagnose: String = ""
    @Published var activityLevelIndex: Int = 0
    @Published var chosedWorkoutFrequencyIndex: Int = 0
    
    init() {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd"
        birthday = formatter.date(from: "1995/10/08") ?? Date()
    }
    
    var sectionSurveyCount: [Int] {
        if selectedGoalIndex == 4 {
            return [5, 6, 2]
        }else{
            return [5, 4, 2]
        }
    }
    
    var surveyTitles: [[String]] {
        if selectedGoalIndex == 4 {
            return  [["full_name_asks", "", ""],
            ["nice_to_meet_you", "what_is_your", "_gender_"],
            ["", "when_is_your", "_birthday_"],
            ["", "What_is_your_height", "_height_"],
            ["", "What_is_your_weight", "_weight_"],
            ["main_goals_asks", "", ""],
            ["focus_areas_asks", "", ""],
            ["body_shape_asks", "", ""],
            ["physical_pain_experience_asks", "", ""],
            ["diagnose_asks", "", ""],
            ["activity_level_asks", "", ""],
            ["how_often_want_workout_asks", "", ""],
            ["", "", ""],]
        }else{
            return  [["full_name_asks", "", ""],
            ["nice_to_meet_you", "what_is_your", "_gender_"],
            ["", "when_is_your", "_birthday_"],
            ["", "What_is_your_height", "_height_"],
            ["", "What_is_your_weight", "_weight_"],
            ["main_goals_asks", "", ""],
            ["focus_areas_asks", "", ""],
            ["body_shape_asks", "", ""],
            ["activity_level_asks", "", ""],
            ["how_often_want_workout_asks", "", ""],
            ["", "", ""],]
        }
        
    }
    
    var sectionsView: [AnyView] {
        if selectedGoalIndex == 4 {
            return [AnyView(NameSurvey()), AnyView(GenderSurvey()), AnyView(BirthdaySurvey()), AnyView(HeightSurvey()), AnyView(WidthSurvey()), AnyView(GoalsSurvey()), AnyView(FocusAreasSurvey()), AnyView(BodyShapeSurvey()), AnyView(PhysicalPainExperienceSurvey()), AnyView(DiagnoseSurvey()), AnyView(ActivityLevelSurvey()), AnyView(WorkoutFrequencySurvey()), AnyView(ZStack{})]
        }else{
            return [AnyView(NameSurvey()), AnyView(GenderSurvey()), AnyView(BirthdaySurvey()), AnyView(HeightSurvey()), AnyView(WidthSurvey()), AnyView(GoalsSurvey()), AnyView(FocusAreasSurvey()), AnyView(BodyShapeSurvey()), AnyView(ActivityLevelSurvey()), AnyView(WorkoutFrequencySurvey()), AnyView(ZStack{})]
        }
    }
    
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
    
    func startSurveyBtnClick() {
        isBack = false
        screensProgress = 3
    }
    
    func signInBtnClick() {
        isBack = false
        screensProgress = 2
    }
    
    func nextPressed() {
        if nextEnabled {
            isBack = false
            switch surveyProgress {
            case 5:
                screensProgress = 6
                self.nextSurvey()
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5){
                    self.screensProgress = 5
                }
            case (sectionSurveyCount[0] + sectionSurveyCount[1]):
                screensProgress = 7
                self.nextSurvey()
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5){
                    self.screensProgress = 5
                }
            case (sectionSurveyCount[0] + sectionSurveyCount[1] + 1):
                screensProgress = 8
                surveyProgress += 1
            default:
                nextSurvey()
            }
            
        }
    }
    
    func nextSurvey(){
        if surveyProgress < sectionSurveyCount.reduce(0, +) { //Sum
            withAnimation {
                surveyProgress += 1
                checker()
            }
        }
    }
    
    func prevSurvey(){
        if screensProgress == 8 {
            surveyProgress -= 1
            screensProgress = 5
            isBack = true
        }else{
            switch surveyProgress {
            case 1:
                screensProgress = 3
                isBack = true
            default:
                withAnimation {
                    surveyProgress -= 1
                }
            }
        }
     
        checker()
    }
    
    func checker() {
        switch surveyProgress {
        case 1:
            return nameChecker()
        case 2, 4, 5, 6, 8, 11:
            nextEnabled = true
        case 3:
            birthdayChecker()
        case 7:
            focusAreasChecker()
        case 9:
            if selectedGoalIndex == 4 {
                nextEnabled = false
            }else{
                nextEnabled = true
            }
        case 10:
            if selectedGoalIndex == 4 {
                nextEnabled = true
            }else{
                nextEnabled = true
            }
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
    
    func focusAreasChecker() {
        nextEnabled = selectedFocusAreas.count > 0
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
        let unit = scrollContentWidth/220
        let defaultScrollTo: CGFloat = CGFloat(weightInKG - 30) * unit
        scrollView.contentOffset.x = defaultScrollTo
    }
    
    func weightRulerLBInOnAppear(_ scrollView: UIScrollView, scrollContentWidth: inout CGFloat) {
        scrollContentWidth = scrollView.contentSize.width - scrollView.frame.width
        let unit = scrollContentWidth/489.5
        let defaultScrollTo: CGFloat = CGFloat(weightInLB - 61) * unit
        scrollView.contentOffset.x = defaultScrollTo
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
        selectedFocusAreas.removeAll()
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
        selectedFocusAreas.removeAll()
    }
    
    func chooseGenderOthers() {
        withAnimation {
            gender = .other
        }
        nextSurvey()
        selectedFocusAreas.removeAll()
    }
}


