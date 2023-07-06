//
//  GenderSurvey.swift
//  DesignScreens
//
//  Created by Aziz's MacBook Air on 05.07.2023.
//

import SwiftUI

struct GenderSurvey: View {
    
    @EnvironmentObject var basicSurveyVM: SurveyVM
    
    var body: some View {
        ScrollViewReader { scrollProxy in
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .center, spacing: 0) {
                    
                    Spacer()
                        .frame(width: 100)
                    
                    GenderImage(image: "male_img", id: 1, genderName: "Male", selectedImage: basicSurveyVM.maleSelectedImage, scale: basicSurveyVM.maleImagescale)
                        .onTapGesture {
                            basicSurveyVM.chooseMale(proxy: scrollProxy)
                        }
                    
                    
                    Color.clear
                        .frame(width: 5)
                        .id(3)
                    
                    GenderImage(image: "female_img", id: 2, genderName: "Female", selectedImage: basicSurveyVM.femaleSelectedImage, scale: basicSurveyVM.femaleImagescale)
                        .onTapGesture {
                            basicSurveyVM.chooseFemale(proxy: scrollProxy)
                        }
                    
                    Spacer()
                        .frame(width: 100)
                    
                }
                .onAppear {
                    scrollProxy.scrollTo(3, anchor: .center)
                    basicSurveyVM.checker()
                }
            }
        }
        
    }
    
    
}




struct CarouselWithParallaxZoomAnimation_Previews: PreviewProvider {
    static var previews: some View {
        GenderSurvey()
    }
}
