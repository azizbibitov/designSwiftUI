//
//  StringExtensions.swift
//  DesignScreens
//
//  Created by Aziz's MacBook Air on 03.07.2023.
//

import Foundation

extension String {
    var localizedForArguments: String {
        return NSLocalizedString(self, comment: "")
    }
    func localizedWithArguments(arguments: CVarArg...) -> String {
        return String(format: self.localizedForArguments, arguments: arguments)
    }
}
