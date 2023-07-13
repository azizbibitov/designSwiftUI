//
//  HeightRulerInFT.swift
//  DesignScreens
//
//  Created by Aziz's MacBook Air on 11.07.2023.
//

import SwiftUI

struct HeightRulerInFT: View { // Ruler - Линейка
    
    var lengthNums: [Int] = [7, 6, 5, 4]
    
    @State private var greenLineOffset: CGFloat = 0
    @State private var scrollingOffset: CGFloat = 0
    @State private var rulerHeight: CGFloat = 0
    
    @EnvironmentObject var basicSurveyVM: SurveyVM
    
    var body: some View {
        
        ZStack {
            
            ScrollView(showsIndicators: false){
                
                VStack(alignment: .trailing, spacing: Sizes.size(18)){
                    
                    ForEach(0..<2) { id in
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: Sizes.size(45), height: Sizes.size(2))
                            .background(Color(hex: "#BEBEBE"))
                            .cornerRadius(5)
                    }
                    
                    
                    HorizontalLine(num: 8)
                    
                    ForEach(0..<4) { id in
                        
                        RulerPartViewForFT(num: lengthNums[id])
                        
                    }
                    
                    ForEach(0..<10) { id in
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: Sizes.size(45), height: Sizes.size(2))
                            .background(Color(hex: "#BEBEBE"))
                            .cornerRadius(5)
                    }
                    
                    ForEach(0..<10) { id in
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: Sizes.size(45), height: Sizes.size(2))
                            .background(Color(hex: "#BEBEBE"))
                            .cornerRadius(5)
                            .opacity(0)
                    }
                    
                    
                }
                .padding(Sizes.size(20))
                .overlay(
                    GeometryReader { geometry in
                        Text("")
                            .onAppear(perform: {
                                rulerHeight = geometry.frame(in: .named("scroll")).size.height - Sizes.size(440) // minus height of ZStack
                            })
                    }
                )
                .background(GeometryReader {
                    Color.clear.preference(key: ViewOffsetKey.self,
                                           value: -$0.frame(in: .named("scroll")).origin.y)
                })
                .onPreferenceChange(ViewOffsetKey.self) { offset in
                  
                    onScroll(offset: offset)
                }
            }
            .coordinateSpace(name: "scroll")
            .onAppear {
                UIScrollView.appearance().bounces = false
            }
            .onDisappear {
                UIScrollView.appearance().bounces = true
            }
            
            VStack {
                HStack {
                    Spacer()
                    
                    HStack {
                        
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: Sizes.size(200), height: Sizes.size(9))
                            .background(Color(hex: "#05FF00"))
                            .cornerRadius(5)
                    }
                    .overlay(
                        HStack {
                            Text("\(basicSurveyVM.heightInFT, specifier: "%.1f") ft")
                                .foregroundColor(Color(hex: "#05FF00"))
                                .font(.title.weight(.bold))
                        }
                            .frame(width: UIScreen.screenWidth-56)
                            .offset(x: -50)
                        ,alignment: .trailing
                    )
                    .offset(y: greenLineOffset)
                }
                .padding(Sizes.size(18))
                
                
                
                Spacer()
            }
            
            HStack{
                if basicSurveyVM.gender == .female {
                    Image("female_img")
                        .resizable()
                        .scaledToFit()
                        .frame(width: Sizes.size(145), height: Sizes.size(420))
                        .offset(x: -50)
                }else{
                    Image("male_img")
                        .resizable()
                        .scaledToFit()
                        .frame(width: Sizes.size(145), height: Sizes.size(420))
                        .offset(x: -50)
                }
            }
            .frame(maxWidth: .infinity)
            .offset(y: greenLineOffset + 40)
            
            
        }
        .frame(height: Sizes.size(440))
        
    }
    
    func onScroll(offset: CGFloat) {
        print("rulerHeight: ", rulerHeight)
        print("heightInFT: ", basicSurveyVM.heightInFT)
        print("scrollingOffset: ", scrollingOffset)
        self.greenLineOffset = offset/5.2
        self.scrollingOffset = offset
        if rulerHeight != 0 {
            let unit = rulerHeight/8.2
            basicSurveyVM.heightInFT = abs(8.2 - Double(scrollingOffset/unit))
        }
    }
    
}

struct HeightRulerInFT_Previews: PreviewProvider {
    static var previews: some View {
        HeightRulerInFT()
            .previewDevice(PreviewDevice(rawValue: DeviceName.iPad_Pro_11_inch_4th_generation.rawValue))
    }
}








