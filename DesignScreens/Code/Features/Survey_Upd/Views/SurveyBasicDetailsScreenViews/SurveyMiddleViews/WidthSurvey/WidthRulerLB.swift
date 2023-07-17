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
    @State var scrollContentWidth: CGFloat = 0
    @State private var oneTimeBool: Bool = true
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
                            
                            ScrollView(.horizontal, showsIndicators: false){
                                
                                LazyHGrid(rows: rows, alignment: .bottom, spacing: 0) {
                                    
                                    // Width = 24644
                                    ForEach(0..<489) { id in
                                        
                                        WidthRulerPart(num: id + 61)
                                            .padding(.trailing, 9)
                                        
                                        
                                    }
                                    
                                    
                                    VerticalLine(num: 550)
                                
                                }
                                .padding(.horizontal, Sizes.size(352)/2 - 2)
                                .introspectScrollView { scrollView in
                                    if oneTimeBool {
                                        basicSurveyVM.weightRulerLBInOnAppear(scrollView, scrollContentWidth: &scrollContentWidth)
                                        oneTimeBool = false
                                    }
                                }
                                .background(GeometryReader {
                                    Color.clear.preference(key: ViewOffsetKey.self,
                                                           value: -$0.frame(in: .named("scroll")).origin.x)
                                })
                                .onPreferenceChange(ViewOffsetKey.self) { offset in
                                    scrollOffset = offset
//                                    onScroll(offset: offset)
                                }
                            }
                            .coordinateSpace(name: "scroll")
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
            let unit = scrollContentWidth/490.0
            basicSurveyVM.weightInLB = scrollOffset/unit + 61
        }
        
    }
    
    
}

struct WidthRulerLB_Previews: PreviewProvider {
    static let basicSurveyVM = SurveyVM()
    static var previews: some View {
        WidthRulerLB()
            .previewDevice(PreviewDevice(rawValue: DeviceName.iPhone_8_Plus.rawValue))
            .environmentObject(basicSurveyVM)
    }
}
