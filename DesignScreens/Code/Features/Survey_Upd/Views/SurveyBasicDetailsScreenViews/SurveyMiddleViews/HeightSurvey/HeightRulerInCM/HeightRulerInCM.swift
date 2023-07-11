//
//  Ruler.swift
//  DesignScreens
//
//  Created by Aziz's MacBook Air on 08.07.2023.
//

import SwiftUI

struct HeightRulerInCM: View { // Ruler - Линейка
    
    var lengthNums: [Int] = [240, 230, 220, 210, 200, 190, 180, 170, 160, 150, 140, 130, 120, 110, 100]
    
    @State private var greenLineOffset: CGFloat = 0
    @State private var scrollingOffset: CGFloat = 0
    @State private var rulerHeight: CGFloat = 0
    
    @EnvironmentObject var basicSurveyVM: SurveyVM
    
    var body: some View {
        
        ZStack {
            
            ScrollView(showsIndicators: false){
                
                VStack(alignment: .trailing, spacing: Sizes.size(18)){
                    
                    HorizontalLine(num: "250")
                    
                    ForEach(0..<16) { id in
                        if id == 15 {
                            RulerPartViewForCM(num: "", isHidden: true)
                        }else{
                            RulerPartViewForCM(num: "\(lengthNums[id])")
                        }
                        
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
                            Text("\(basicSurveyVM.heightInCM) cm")
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
        self.greenLineOffset = offset/14.7
        self.scrollingOffset = offset
        if rulerHeight != 0 {
            let unit = rulerHeight/150.1
            basicSurveyVM.heightInCM = 250 - Int(scrollingOffset/unit)
        }
    }
    
}

struct Ruler_Previews: PreviewProvider {
    static var previews: some View {
        HeightRulerInCM()
            .previewDevice(PreviewDevice(rawValue: DeviceName.iPad_Pro_11_inch_4th_generation.rawValue))
    }
}







