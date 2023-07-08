//
//  GenderImage.swift
//  DesignScreens
//
//  Created by Aziz's MacBook Air on 06.07.2023.
//

import SwiftUI

struct GenderImage: View {
    
    var image: String
    var id: Int
    var genderName: String
    var selectedImage: String
    var scale: CGFloat
    
    var body: some View {
        
        ZStack {
            VStack {
                Spacer()
                Spacer()
                
                Image(selectedImage)
                    .resizable()
                    .scaledToFit()
                    .scaleEffect(CGSize(width: scale, height: scale))
                    .frame(width: Sizes.size(270), height: Sizes.size(290))
                    .id(id)
                
                Spacer()
                Spacer()
                Spacer()
            }
           
            VStack {
                Image(image)
                    .resizable()
                    .scaledToFit()
                    .scaleEffect(CGSize(width: scale, height: scale))
                    .frame(width: Sizes.size(145), height: Sizes.size(420))
                    .id(id)
                
                Text(genderName)
                    .font(.title.weight(.bold))
                    .foregroundColor(.white)
            }
            
        }
        .id(id)
       
    }
    
}

struct GenderImage_Previews: PreviewProvider {
    @State static var scale: CGFloat = 1
    static var previews: some View {
        GenderImage(image: "male_img", id: 1, genderName: "Male", selectedImage: "gender_selected", scale: scale)
    }
}
