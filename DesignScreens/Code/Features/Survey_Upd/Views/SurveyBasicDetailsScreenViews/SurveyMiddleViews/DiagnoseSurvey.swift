//
//  DiagnoseSurvey.swift
//  DesignScreens
//
//  Created by Aziz's MacBook Air on 20.07.2023.
//

import SwiftUI

struct DiagnoseSurvey: View {
    
    var diagnoses: [String] = ["Knee Pain", "Knee Meniscus Replacement", "Knee meniscus suture", "Lower back herniated disk", "Lower back pain"]
    @EnvironmentObject var basicSurveyVM: SurveyVM
    @ObservedObject private var keyboard = KeyboardResponder()
    @State var noInjuries: Bool = false
    
    var body: some View {
        VStack(spacing: 25){
            Text("Please select injuries you've been diagnosed with")
                .foregroundColor(.white)
                .font(.subheadline)
            
            ScrollView(.vertical, showsIndicators: true) {
                
                VStack(spacing: 7){
                    // Diagnoses
                    ForEach(diagnoses, id: \.self) { diagnose in
                        
                        Button {
                            if basicSurveyVM.diagnosesString.contains(diagnose) {
                                if let index = basicSurveyVM.diagnosesString.firstIndex(where: {$0 == diagnose}) {
                                    basicSurveyVM.diagnosesString.remove(at: index)
                                }
                            }else{
                                basicSurveyVM.diagnosesString.append(diagnose)
                                if noInjuries {
                                    noInjuries = false
                                }
                            }
                        } label: {
                            HStack {
                                Text(diagnose)
                                    .shadow(color: .black, radius: 7, x: 0, y: 2)
                                    .font(.headline.weight(.bold))
                                    .foregroundColor(.white)
                                    .foregroundColor(basicSurveyVM.diagnosesString.contains(diagnose) ? Color(hex: "#777777") : .white)
                                   
                                    .padding(.vertical, Sizes.size(19))
                                    .padding(.horizontal, Sizes.size(15))
                                    .background(basicSurveyVM.diagnosesString.contains(diagnose) ? Color(hex: "#04BA00") : .clear)
                                    .cornerRadius(15)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 15)
                                            .inset(by: 0.5)
                                            .stroke(.white, lineWidth: 1)
                                    )
                                
                                Spacer()
                            }
                            
                            
                        }
                        
                    }
                    
                    // TextField
                    HStack {
                        if #available(iOS 15.0, *) {
                            TextField("", text: $basicSurveyVM.otherDiagnose)
                                .placeholder(when: basicSurveyVM.otherDiagnose.isEmpty, placeholder: {
                                    Text("Other?")
                                        .foregroundColor(Color(hex: "#505050"))
                                })
                                .foregroundColor(Color.white)
                                .shadow(color: .black, radius: 7, x: 0, y: 2)
                                .font(.headline.weight(.bold))
                                .submitLabel(.done)
                                .padding(.vertical, Sizes.size(19))
                                .padding(.horizontal, Sizes.size(15))
                                .frame(maxWidth: 120)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 15)
                                        .inset(by: 0.5)
                                        .stroke(.white, lineWidth: 1)
                                )
                        }else{
                            TextField("", text: $basicSurveyVM.otherDiagnose)
                                .placeholder(when: basicSurveyVM.otherDiagnose.isEmpty, placeholder: {
                                    Text("Other?")
                                        .foregroundColor(Color(hex: "#505050"))
                                })
                                .foregroundColor(Color.white)
                                .shadow(color: .black, radius: 7, x: 0, y: 2)
                                .font(.headline.weight(.bold))
                                .padding(.vertical, Sizes.size(19))
                                .padding(.horizontal, Sizes.size(15))
                                .frame(maxWidth: 120)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 15)
                                        .inset(by: 0.5)
                                        .stroke(.white, lineWidth: 1)
                                )
                        }
                        
                        Spacer()
                    }
                    
                }
                .padding(.horizontal, 20)
              
            }.frame(height: 300)
            
            HStack(spacing: 12){
                
                Button {
                    withAnimation {
                        noInjuries.toggle()
                        if noInjuries {
                            basicSurveyVM.otherDiagnose = ""
                            basicSurveyVM.diagnosesString = []
                        }
                    }
                } label: {
                    Text("No, I have not had any injuries")
                        .shadow(color: .black, radius: 7, x: 0, y: 2)
                        .font(.headline.weight(.bold))
                        .foregroundColor(.white)
                        .foregroundColor(noInjuries ? Color(hex: "#777777") : .white)
                        .padding(.vertical, Sizes.size(19))
                        .padding(.horizontal, Sizes.size(15))
                        .background(noInjuries ? Color(hex: "#04BA00") : .clear)
                        .cornerRadius(15)
                        .overlay(
                            RoundedRectangle(cornerRadius: 15)
                                .inset(by: 0.5)
                                .stroke(.white, lineWidth: 1)
                        )
                }
                
                Button {
                    print("infoBtnClick")
                } label: {
                    Image(systemName: "info.circle")
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(Color(hex: "#505050"))
                        .frame(width: 25, height: 25)
                }
                
                
                
                Spacer()
                
            }
            .padding(.horizontal, 20)
            
            Spacer()
        }
        .padding(.bottom, keyboard.currentHeight)
        .edgesIgnoringSafeArea(.bottom)
        .animation(.easeOut(duration: 0.16))
        
        .onChange(of: basicSurveyVM.otherDiagnose) { newValue in
            if noInjuries && basicSurveyVM.otherDiagnose != "" {
                noInjuries = false
            }
        }
        
    }
}

struct DiagnoseSurvey_Previews: PreviewProvider {
    static let basicSurveyVM = SurveyVM()
    static var previews: some View {
        DiagnoseSurvey()
            .environmentObject(basicSurveyVM)
    }
}

final class KeyboardResponder: ObservableObject {
    private var notificationCenter: NotificationCenter
    @Published private(set) var currentHeight: CGFloat = 0

    init(center: NotificationCenter = .default) {
        notificationCenter = center
        notificationCenter.addObserver(self, selector: #selector(keyBoardWillShow(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        notificationCenter.addObserver(self, selector: #selector(keyBoardWillHide(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    deinit {
        notificationCenter.removeObserver(self)
    }

    @objc func keyBoardWillShow(notification: Notification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            currentHeight = keyboardSize.height
        }
    }

    @objc func keyBoardWillHide(notification: Notification) {
        currentHeight = 0
    }
}
