//
//  BirthdaySurvey.swift
//  DesignScreens
//
//  Created by Aziz's MacBook Air on 06.07.2023.
//

import SwiftUI

struct BirthdaySurvey: View {
    
    @EnvironmentObject var basicSurveyVM: SurveyVM
    
    var body: some View {
        
        VStack(spacing: 20){
            HStack(spacing: 23){
                Image("birthday_icon")
                
                Text("We will adjust our workouts to best suit your age, give rewards for your progress, and more!")
                    .font(.subheadline)
                    .foregroundColor(.white)
                    .lineLimit(5)
            }
            .padding(.vertical)
            .padding(.horizontal)
            .background(Color(hex: "2D2D2D").opacity(0.5))
            .cornerRadius(30)
            
            
            DatePicker("select_date".localizable, selection: $basicSurveyVM.birthday, displayedComponents: .date)
                .foregroundColor(.white)
                .environment(\.colorScheme, .dark)
                .labelsHidden()
                .datePickerStyle(WheelDatePickerStyle())
        }
        .padding(.top)
        .padding(.horizontal, 40)
        
        .onAppear(perform: {
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy/MM/dd"
            basicSurveyVM.birthday = formatter.date(from: "1995/10/08") ?? Date()
            basicSurveyVM.checker()
        })
    }
}
//birthday_icon
struct BirthdaySurvey_Previews: PreviewProvider {
    @StateObject static var survey = SurveyVM()
    static var previews: some View {
        BirthdaySurvey()
            .environmentObject(survey)
    }
}
