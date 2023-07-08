//
//  NameSurvey.swift
//  DesignScreens
//
//  Created by Aziz's MacBook Air on 05.07.2023.
//

import SwiftUI
import Introspect

struct NameSurvey: View {
    
    @EnvironmentObject var basicSurveyVM: SurveyVM
    @State var field: UITextField?
    var body: some View {
        VStack {
            TextField("full_name".localizable, text: $basicSurveyVM.userName)
                .multilineTextAlignment(.center)
                .foregroundColor(.white)
                .dynamicFontSize(text: $basicSurveyVM.userName)
                .padding(.top,30).padding(.bottom, 10)
                .cornerRadius(15)
                .introspectTextField { textField in
                    DispatchQueue.main.async {
                        field = textField
                    }
                }
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5){
                        field?.becomeFirstResponder()
                    }
                }
                .onChange(of: basicSurveyVM.userName, perform: {
                    new in
                    basicSurveyVM.checker()
                })
            
            
            Divider().padding(.horizontal).overlay(Color(hex: "#515151").padding(.horizontal))
            
        }
        .onAppear {
            basicSurveyVM.checker()
        }
    }
}

struct NameSurveyField_Previews: PreviewProvider {
    static let basicSurveyVM = SurveyVM()
    static var previews: some View {
        NameSurvey()
            .environmentObject(basicSurveyVM)
    }
}



struct SetFirstResponderTextField: ViewModifier {
    @State var isFirstResponderSet = false
    
    func body(content: Content) -> some View {
        content
            .introspectTextField { textField in
                if self.isFirstResponderSet == false {
                    textField.becomeFirstResponder()
                    self.isFirstResponderSet = true
                }
            }
    }
}
