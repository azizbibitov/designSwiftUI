//
//  Sizes.swift
//  DesignScreens
//
//  Created by Aziz's MacBook Air on 02.07.2023.
//

import UIKit

class Sizes {
    // For Views' Responsiveness according to Device's Screen Size
    static let averageFigmaScreenWidth: CGFloat = 430
    static let averageFigmaScreenHeight: CGFloat = 930
    
   
    
    static func size(_ size: CGFloat) -> CGFloat {
        
        if UIDevice.current.userInterfaceIdiom == .pad {
            let deviceScreenAdaptedHeight = (UIScreen.screenWidth / averageFigmaScreenWidth) * size * 0.75
            return deviceScreenAdaptedHeight
        } else {
            //iPhone
            let deviceScreenAdaptedHeight = (UIScreen.screenHeight / averageFigmaScreenHeight) * size * 0.9
            return deviceScreenAdaptedHeight
        }
    }
    
}
