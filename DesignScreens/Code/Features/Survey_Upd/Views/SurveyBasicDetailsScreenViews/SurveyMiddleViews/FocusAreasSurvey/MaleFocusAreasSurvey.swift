//
//  MaleFocusAreasSurvey.swift
//  DesignScreens
//
//  Created by Aziz's MacBook Air on 19.07.2023.
//

import SwiftUI

var maleFocusAreas: [FocusArea] = [
    FocusArea(name: "Arms", image: "arms_selected_male", index: 0),
    FocusArea(name: "Chest", image: "chest_selected_male", index: 1),
    FocusArea(name: "Abs", image: "abs_selected_male", index: 2),
    FocusArea(name: "Legs", image: "legs_selected_male", index: 3),
]


struct MaleFocusAreasSurvey: View {
    @EnvironmentObject var basicSurveyVM: SurveyVM
    var body: some View {
        
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 25){
                ZStack{
                    
                    ZStack {
                        Image("male_body")
                        uponImages
                    }
                    .padding(.trailing, 125)
                    
                    // Buttons with connectors
                    VStack(alignment: .trailing, spacing: 20){
                        
                        HStack(spacing: 0) {
                            Image("male_connector_arms")
                                .opacity(0)
                            MaleButtonWithChecker(buttonSize: CGSize(width: UIScreen.screenWidth/3, height: 42), checkerSize: 15, text: maleFocusAreas[0].name, index: 0)
                            
                        }
                        .overlay(
                            Image("male_connector_arms"),
                            alignment: .leading
                        )
                        
                        ZStack(alignment: .bottom){
                            
                            HStack(spacing: 0) {
                                Image("male_connector_chest")
                                    .opacity(0)
                                    .frame(height: 0)
                                MaleButtonWithChecker(buttonSize: CGSize(width:  UIScreen.screenWidth/3, height: 42), checkerSize: 15, text: maleFocusAreas[1].name, index: 1)
                            }
                            .overlay(
                                Image("male_connector_chest")
                                    .padding(.bottom, 20),
                                alignment: .bottomLeading
                            )
                            
                        }
                        
                        ZStack(alignment: .bottom){
                            
                            HStack(spacing: 0) {
                                Image("male_connector_abs")
                                    .opacity(0)
                                    .frame(height: 0)
                                MaleButtonWithChecker(buttonSize: CGSize(width:  UIScreen.screenWidth/3, height: 42), checkerSize: 15, text: maleFocusAreas[2].name, index: 2)
                            }
                            .overlay(
                                Image("male_connector_abs")
                                    .padding(.bottom, 20),
                                alignment: .bottomLeading
                            )
                            
                        }
                        
                        
                        HStack(spacing: 0) {
                            Image("male_connector_legs")
                            MaleButtonWithChecker(buttonSize: CGSize(width:  UIScreen.screenWidth/3, height: 42), checkerSize: 15, text: maleFocusAreas[3].name, index: 3)
                        }
                        
                        Spacer()
                            .frame(height: 25)
                    }
                    .padding(.leading, 125)
                    
                }
                
                MaleButtonWithChecker(buttonSize: CGSize(width: UIScreen.screenWidth - 80, height: 42), checkerSize: 20, text: "Full Body", index: 5)
                
            }
            
            
        }
        
        
    }
    
    
    
    var uponImages: some View {
        ZStack {
            ForEach(basicSurveyVM.selectedFocusAreas, id: \.hashValue) { area in
                Image(area.image)
            }
        }
    }
    
}

struct MaleFocusAreasSurvey_Previews: PreviewProvider {
    static let basicSurveyVM = SurveyVM()
    static var previews: some View {
        MaleFocusAreasSurvey()
            .environmentObject(basicSurveyVM)
    }
}


struct MaleButtonWithChecker: View {
    @EnvironmentObject var basicSurveyVM: SurveyVM
    var buttonSize: CGSize
    var checkerSize: CGFloat
    var text: String
    var index: Int
    
    var color: String {
        if index == 5 {
            if basicSurveyVM.selectedFocusAreas.count < 4 {
                return "#686868"
            }else{
                return "#04BA00"
            }
        }else{
            if basicSurveyVM.selectedFocusAreas.filter({ $0.index == index }).isEmpty {
                return "#686868"
            }else{
                return "#04BA00"
            }
        }
    }
    
    var image: String {
        if index == 5 {
            if basicSurveyVM.selectedFocusAreas.count < 4 {
                return "unchecked"
            }else{
                return "checked"
            }
        }else{
            if basicSurveyVM.selectedFocusAreas.filter({ $0.index == index }).isEmpty {
                return "unchecked"
            }else{
                return "checked"
            }
        }
    }
    
    var body: some View {
        Button {
            withAnimation {
                onBtnTap()
            }
        } label: {
            
            ZStack {
                
                Color(hex: color)
                
                HStack {
                    Image(image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: checkerSize, height: checkerSize)
                        .padding(.leading, checkerSize)
                    
                    Spacer()
                }
                
                Text(text)
                    .foregroundColor(.white)
                    .font(.title3.weight(.bold))
                
            }
            .cornerRadius(15)
            
        }
        .frame(width: buttonSize.width, height: buttonSize.height)
    }
    
    func onBtnTap() {
        if index == 5 {
            if basicSurveyVM.selectedFocusAreas.count < 4 {
                basicSurveyVM.selectedFocusAreas.removeAll()
                maleFocusAreas.forEach { area in
                    basicSurveyVM.selectedFocusAreas.append(area)
                }
            }else{
                basicSurveyVM.selectedFocusAreas.removeAll()
            }
        }else{
            if basicSurveyVM.selectedFocusAreas.filter({ $0.index == index }).isEmpty {
                basicSurveyVM.selectedFocusAreas.append(maleFocusAreas[index])
                if  basicSurveyVM.selectedFocusAreas.count >= 4 {
                    basicSurveyVM.selectedFocusAreas.remove(at: 0)
                }
            }else{
                if let index = basicSurveyVM.selectedFocusAreas.firstIndex(where: {$0.name == text}) {
                    basicSurveyVM.selectedFocusAreas.remove(at: index)
                }
            }
        }
        basicSurveyVM.checker()
    }
    
}
