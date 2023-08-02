//
//  PhysicalPainExperienceSurvey.swift
//  DesignScreens
//
//  Created by Aziz's MacBook Air on 20.07.2023.
//

import SwiftUI

struct PhysicalPainExperienceSurvey: View {
    
    @EnvironmentObject var basicSurveyVM: SurveyVM
    
    @State var noSelected: Bool = false
    @State var yesSelected: Bool = false
    
    var body: some View {
        
        ScrollView(.vertical, showsIndicators: false) {
            
            VStack(spacing: 65){
                Spacer()
                HStack(alignment: .center, spacing: 70){
                    
                    Button {
                        withAnimation {
                            noSelected.toggle()
                            if noSelected {
                                yesSelected = !noSelected
                                basicSurveyVM.nextEnabled = true
                            }else{
                                basicSurveyVM.nextEnabled = false
                            }
                        }
                    } label: {
                        Text("No")
                            .shadow(color: .black, radius: 7, x: 0, y: 2)
                            .frame(width: 125)
                            .font(.title.weight(.bold))
                            .foregroundColor(noSelected ? .white : Color(hex: "#777777"))
                            .padding(.vertical, Sizes.size(19))
                            .background(noSelected ? Color(hex: "#05FF00") : Color(hex: "#292929"))
                            .cornerRadius(20)
                            .overlay(
                                RoundedRectangle(cornerRadius: 20)
                                    .inset(by: 0.5)
                                    .stroke(Color(hex: "#9A9A9A"), lineWidth: 1)
                            )
                        
                    }
                    
                    
                    Button {
                        withAnimation {
                            yesSelected.toggle()
                            if yesSelected {
                                noSelected = !yesSelected
                                basicSurveyVM.nextEnabled = true
                            }else{
                                basicSurveyVM.nextEnabled = false
                            }
                        }
                    } label: {
                        Text("Yes")
                            .shadow(color: .black, radius: 7, x: 0, y: 2)
                            .frame(width: 125)
                            .font(.title.weight(.bold))
                            .foregroundColor(yesSelected ? .white : Color(hex: "#777777"))
                            .padding(.vertical, Sizes.size(19))
                            .background(yesSelected ? Color(hex: "#05FF00") : Color(hex: "#292929"))
                            .cornerRadius(20)
                            .overlay(
                                RoundedRectangle(cornerRadius: 20)
                                    .inset(by: 0.5)
                                    .stroke(Color(hex: "#9A9A9A"), lineWidth: 1)
                            )
                    }
                    
         
                 
                    
                }
//                .frame(width: 320)
                
                // Response View
                
                ZStack {
                    ResponseView(yesSelected: true)
                        .opacity(yesSelected ? 1 : 0)
                    
                    ResponseView(yesSelected: false)
                        .opacity(noSelected ? 1 : 0)
                }
                
                
                Spacer()
            }
            
        }
        .frame(maxWidth: .infinity)
        
        .onAppear {
            yesSelected = basicSurveyVM.hasPainExperience
            if yesSelected { basicSurveyVM.nextEnabled = true }
        }
        .onDisappear {
            basicSurveyVM.hasPainExperience = yesSelected
        }
      
        
    }
}

struct ResponseView: View {
    
    var yesSelected: Bool = false


    var body: some View {
        VStack(spacing: 15){
            
            Text(!yesSelected ? "Great to hear!" : "No worries!")
                .foregroundColor(Color(hex: "#05FF00"))
                .font(.title.bold())
            
            Text(!yesSelected ? "You're on the right track to full recovery. Let's continue the good work and aim to make those once painful areas stronger and more resilient." : "Remember, pain is part of the journey, but we're here to help you navigate through it. Together, we'll focus on alleviating this pain and building strength.")
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
                .font(.subheadline)
            
        }
        .padding(.horizontal, 25).padding(.top, 14).padding(.bottom, 30)
        .background(Rectangle().fill(Color(red: 0.17, green: 0.17, blue: 0.17).opacity(0.5)).cornerRadius(30))
        .padding(.horizontal, 40)
    }


}

struct PhysicalPainExperienceSurvey_Previews: PreviewProvider {
    static var previews: some View {
        PhysicalPainExperienceSurvey()
    }
}
