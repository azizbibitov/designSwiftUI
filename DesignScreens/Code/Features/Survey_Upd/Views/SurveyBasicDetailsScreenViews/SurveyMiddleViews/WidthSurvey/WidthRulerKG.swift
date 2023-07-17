//
//  WidthRulerKG.swift
//  DesignScreens
//
//  Created by Aziz's MacBook Air on 12.07.2023.
//

import SwiftUI

struct WidthRulerKG: View {
    
    @EnvironmentObject var basicSurveyVM: SurveyVM
    
    @State var scrollOffset = CGFloat.zero
    @State var scrollContentWidth: CGFloat = 0//24640 - Sizes.size(1) // Calculated Value
    @State private var oneTimeBool: Bool = true
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
                                    
                                    Text("\(basicSurveyVM.weightInKG, specifier: "%.1f") kg")
                                        .font(Font.system(size: Sizes.size(40), weight: .bold))
                                        .foregroundColor(Color(hex: "#04C600"))
                                }
                            )
                            .padding(.top, Sizes.size(32))
                        
                        ZStack(alignment: .bottom) {
                            
//                            ObservableScrollView(scrollOffset: $scrollOffset) { proxy in
                            ScrollView(.horizontal, showsIndicators: false){
                                
                                LazyHGrid(rows: rows, alignment: .bottom, spacing: 0) {
                                    
                                    ForEach(0..<220) { id in
                                        
                                        WidthRulerPart(num: id + 30)
                                            .padding(.trailing, 9)
                                        
                                        
                                    }
                                    
                                    
                                    VerticalLine(num: 250)
                                    
                                }
                                .padding(.horizontal, Sizes.size(352)/2 - 2)
                                .introspectScrollView { scrollView in
                                    if oneTimeBool {
                                        let space = Sizes.size(352)/2 - 2
                                        scrollContentWidth = scrollView.contentSize.width - scrollView.frame.width
                                        let rulerContentWidth = scrollContentWidth - 2*space
                                        let unit = rulerContentWidth/220.0
                                        scrollView.contentOffset.x = unit*20
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
                            
                            HStack(alignment: .bottom, spacing: 0) {
                                
                                Spacer()
                                
                                Rectangle()
                                    .foregroundColor(.clear)
                                    .frame(width: Sizes.size(7), height: Sizes.size(110))
                                    .background(Color(hex: "#05FF00"))
                                    .cornerRadius(5)
                                
                                
                                Spacer()
                                
                            }
                            .frame(width: Sizes.size(352))
                            .padding(.bottom, 18)
                            
                            
                        }
                        
                    }
                        .cornerRadius(50)
                    
                    
                )
            
        }
        .frame(width: Sizes.size(352))
        
        .onChange(of: scrollOffset) { newValue in
            let space = Sizes.size(352)/2 - 2
            let rulerContentWidth = scrollContentWidth - 2*space
            let unit = rulerContentWidth/220.0
            basicSurveyVM.weightInKG = scrollOffset/unit + 30
        }
        
    }
    
    
}

struct WidthRulerKG_Previews: PreviewProvider {
    static let basicSurveyVM = SurveyVM()
    static var previews: some View {
        WidthRulerKG()
            .previewDevice(PreviewDevice(rawValue: DeviceName.iPhone_14.rawValue))
            .environmentObject(basicSurveyVM)
    }
}
