//
//  WidthRulerLB.swift
//  DesignScreens
//
//  Created by Aziz's MacBook Air on 14.07.2023.
//

import SwiftUI

struct WidthRulerLB: View {
    
    @EnvironmentObject var basicSurveyVM: SurveyVM
    
    @State var scrollOffset = CGFloat.zero
     // Calculated Value
    
    let rows = [
        GridItem(.fixed(50))
    ]
    
    var body: some View {
        ZStack {
            
            Rectangle()
                .foregroundColor(.clear)
                .frame(width: Sizes.size(352), height: Sizes.size(310))
                .background(Color.white)
                .cornerRadius(50)
                .overlay(
                    
                    VStack(spacing: 22) {
                        
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: Sizes.size(277), height: Sizes.size(101))
                            .cornerRadius(30)
                            .overlay(
                                ZStack {
                                    RoundedRectangle(cornerRadius: 30)
                                        .inset(by: 0.5)
                                        .stroke(.black, lineWidth: 1)
                                    
                                    Text("\(basicSurveyVM.weightInLB, specifier: "%.1f") lb")
                                        .font(Font.system(size: Sizes.size(40), weight: .bold))
                                        .foregroundColor(Color(hex: "#04C600"))
                                }
                            )
                            .padding(.top, Sizes.size(32))
                        
                        ZStack(alignment: .bottom) {
                            
                            ObservableScrollView(scrollOffset: $scrollOffset) { proxy in
                                
                                LazyHGrid(rows: rows, alignment: .bottom, spacing: 0) {
                                    
                                    
                                    Spacer()
                                        .frame(width: Sizes.size(352)/2 - 2)
                                    // Width = 24644
                                    ForEach(0..<489) { id in
                                        
                                        WidthRulerPart(num: id + 61)
                                            .padding(.trailing, 9)
                                        
                                        
                                    }
                                    
                                    
                                    VerticalLine(num: 550)
                                    
                                    Color.clear
                                        .frame(width: Sizes.size(352)/2 - 2)
                                    
                                }
                            }
                            .onAppear {
                                UIScrollView.appearance().bounces = false
                            }
                            .onDisappear {
                                UIScrollView.appearance().bounces = true
                            }
                            .padding(.bottom, 20)
                            .clipped()
                            
                            HStack(alignment: .bottom) {
                                
                                Spacer()
                                
                                Rectangle()
                                    .foregroundColor(.clear)
                                    .frame(width: Sizes.size(7), height: Sizes.size(110))
                                    .background(Color(hex: "#05FF00"))
                                    .cornerRadius(5)
                                
                                
                                Spacer()
                                
                            }
                            .frame(maxWidth: .infinity)
                            .padding(.bottom, 18)
                            
                            
                        }
                        
                    }
                        .cornerRadius(50)
                    
                    
                )
            
        }
        .frame(width: Sizes.size(352))
        
        .onChange(of: scrollOffset) { newValue in
            let scrollContentWidth: CGFloat = 54768
            let unit = scrollContentWidth/489
            basicSurveyVM.weightInLB = scrollOffset/unit + 61
        }
        
    }
    
    
}

struct WidthRulerLB_Previews: PreviewProvider {
    static let basicSurveyVM = SurveyVM()
    static var previews: some View {
        WidthRulerLB()
            .previewDevice(PreviewDevice(rawValue: DeviceName.iPhone_14.rawValue))
            .environmentObject(basicSurveyVM)
    }
}
