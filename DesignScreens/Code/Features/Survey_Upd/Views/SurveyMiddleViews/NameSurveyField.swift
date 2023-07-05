//
//  NameSurveyField.swift
//  DesignScreens
//
//  Created by Aziz's MacBook Air on 05.07.2023.
//

import SwiftUI

struct NameSurveyField: View {
    @EnvironmentObject var basicSurveyVM: SurveyVM
    var body: some View {
        VStack {
            TextField("full_name".localizedForArguments, text: $basicSurveyVM.userName)
                .multilineTextAlignment(.center)
                .foregroundColor(.white)
                .dynamicFontSize(text: $basicSurveyVM.userName)
                .padding(.top,30).padding(.bottom, 10)
                .cornerRadius(15)
                .introspectTextField { textField in
                    DispatchQueue.main.async {
                        textField.becomeFirstResponder()
                    }
                }
                .onChange(of: basicSurveyVM.userName, perform: {
                    new in
                    basicSurveyVM.checker()
                })
                .onAppear {
                    basicSurveyVM.checker()
                }
            Divider().padding(.horizontal).overlay(Color(hex: "#515151").padding(.horizontal))

        }
    }
}

struct NameSurveyField_Previews: PreviewProvider {
    static let basicSurveyVM = SurveyVM()
    static var previews: some View {
        NameSurveyField()
            .environmentObject(basicSurveyVM)
    }
}
