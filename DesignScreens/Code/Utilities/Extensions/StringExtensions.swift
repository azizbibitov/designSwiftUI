//
//  StringExtensions.swift
//  DesignScreens
//
//  Created by Aziz's MacBook Air on 03.07.2023.
//

import Foundation

extension String {
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
    func localized(arguments: CVarArg...) -> String {
        return String(format: self.localized, arguments: arguments)
    }
}
