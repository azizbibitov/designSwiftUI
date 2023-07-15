//
//  ContentView.swift
//  DesignScreens
//
//  Created by Aziz's MacBook Air on 01.07.2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject var basicSurveyVM = SurveyVM()
    var body: some View {
        SurveyUpdateMain()
            .environmentObject(basicSurveyVM)
    }
}

struct ContentView_Previews: PreviewProvider {
    static let basicSurveyVM = SurveyVM()
    static var previews: some View {
        ContentView()
            .environmentObject(basicSurveyVM)
    }
}
