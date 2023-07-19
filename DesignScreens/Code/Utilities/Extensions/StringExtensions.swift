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

extension String: Identifiable {
    public typealias ID = Int
    public var id: Int {
        return hash
    }
}
