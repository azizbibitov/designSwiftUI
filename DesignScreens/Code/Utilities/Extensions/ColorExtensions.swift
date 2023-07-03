//
//  ColorExtensions.swift
//  DesignScreens
//
//  Created by Aziz's MacBook Air on 02.07.2023.
//

import SwiftUI

extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (1, 1, 1, 0)
        }

        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue:  Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
    
    init?(_ hex: String) {
      var str = hex
      if str.hasPrefix("#") {
        str.removeFirst()
      }
      if str.count == 3 {
        str = String(repeating: str[str.startIndex], count: 2)
          + String(repeating: str[str.index(str.startIndex, offsetBy: 1)], count: 2)
          + String(repeating: str[str.index(str.startIndex, offsetBy: 2)], count: 2)
      } else if !str.count.isMultiple(of: 2) || str.count > 8 {
        return nil
      }
      let scanner = Scanner(string: str)
      var color: UInt64 = 0
      scanner.scanHexInt64(&color)
      if str.count == 2 {
        let gray = Double(Int(color) & 0xFF) / 255
        self.init(.sRGB, red: gray, green: gray, blue: gray, opacity: 1)
      } else if str.count == 4 {
        let gray = Double(Int(color >> 8) & 0x00FF) / 255
        let alpha = Double(Int(color) & 0x00FF) / 255
        self.init(.sRGB, red: gray, green: gray, blue: gray, opacity: alpha)
      } else if str.count == 6 {
        let red = Double(Int(color >> 16) & 0x0000FF) / 255
        let green = Double(Int(color >> 8) & 0x0000FF) / 255
        let blue = Double(Int(color) & 0x0000FF) / 255
        self.init(.sRGB, red: red, green: green, blue: blue, opacity: 1)
      } else if str.count == 8 {
        let red = Double(Int(color >> 24) & 0x000000FF) / 255
        let green = Double(Int(color >> 16) & 0x000000FF) / 255
        let blue = Double(Int(color >> 8) & 0x000000FF) / 255
        let alpha = Double(Int(color) & 0x000000FF) / 255
        self.init(.sRGB, red: red, green: green, blue: blue, opacity: alpha)
      } else {
        return nil
      }
    }
}
