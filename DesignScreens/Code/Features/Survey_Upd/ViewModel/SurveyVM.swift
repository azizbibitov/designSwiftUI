//
//  SurveyVM.swift
//  DesignScreens
//
//  Created by Aziz's MacBook Air on 03.07.2023.
//

import Foundation

class SurveyVM: ObservableObject {
    
    @Published var maxElements: Int = 5
    @Published var progress: Int = 1
    
    @Published var userName: String = "Vmir"
    
    
}

