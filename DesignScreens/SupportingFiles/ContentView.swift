//
//  ContentView.swift
//  DesignScreens
//
//  Created by Aziz's MacBook Air on 01.07.2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject var homeNewVM = HomeVM()
    var body: some View {
        TabsView()
            .environmentObject(homeNewVM)
    }
}

struct ContentView_Previews: PreviewProvider {
    static let basicSurveyVM = SurveyVM()
    static var previews: some View {
        ContentView()
            .environmentObject(basicSurveyVM)
    }
}
