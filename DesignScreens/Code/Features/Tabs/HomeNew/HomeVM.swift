//
//  HomeVM.swift
//  DesignScreens
//
//  Created by Aziz's MacBook Air on 02.08.2023.
//

import SwiftUI

class HomeVM: ObservableObject {
    
    @Published var userPlansCount: Int = 0
    
    @Published var optionsShow: Bool = false
    
}
