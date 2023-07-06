//
//  StringExtensions.swift
//  DesignScreens
//
//  Created by Aziz's MacBook Air on 03.07.2023.
//

import Foundation

extension String {
    var localizable: String {
        return NSLocalizedString(self, comment: "")
    }
    func localizable(arguments: CVarArg...) -> String {
        return String(format: self.localizable, arguments: arguments)
    }
}
