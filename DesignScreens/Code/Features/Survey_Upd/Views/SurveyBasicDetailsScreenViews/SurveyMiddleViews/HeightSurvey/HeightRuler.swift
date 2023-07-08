//
//  Ruler.swift
//  DesignScreens
//
//  Created by Aziz's MacBook Air on 08.07.2023.
//

import SwiftUI

struct HeightRuler: View { // Ruler - Линейка
    
    var lengthNums: [Int] = [240, 230, 220, 210, 200, 190, 180, 170, 160, 150, 140, 130, 120, 110, 100]
    
    @State var offset: CGFloat = 0
    
    var body: some View {
        
        ZStack {
            
           
            
            ScrollView(showsIndicators: false){
                
                VStack(alignment: .trailing, spacing: Sizes.size(18)){
                    
                    HorizontalLine(num: "250")
                    
                    ForEach(0..<15) { id in
                        RulerPartView(num: "\(lengthNums[id])")
                    }
                }
                .padding(Sizes.size(20))
                
                
                
                .background(GeometryReader {
                    Color.clear.preference(key: ViewOffsetKey.self,
                                           value: -$0.frame(in: .named("scroll")).origin.y)
                })
                .onPreferenceChange(ViewOffsetKey.self) { offset in
//                    print("offset >> \($0)")
                    
                    self.offset = offset
                    print("offset >> \(offset)")
                    
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
                            Text("175 cm")
                                .foregroundColor(Color(hex: "#05FF00"))
                                .font(.title.weight(.bold))
                            
                            Spacer()
                        }
                            .frame(width: Sizes.size(370))
                        ,alignment: .trailing
                    )
                    .offset(y: offset)
                }
                .padding(Sizes.size(18))
                
                Spacer()
            }
          
           
            
        }
        .frame(height: Sizes.size(440))
        
    }
    
}

struct Ruler_Previews: PreviewProvider {
    static var previews: some View {
        HeightRuler()
    }
}







