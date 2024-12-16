//
//  String+ext.swift
//  FitFoodCore
//
//  Created by Habibur Rahman on 14/12/24.
//

import Foundation
import SwiftUI

extension String {
    func toInt() -> Int? {
        return Int(self)
    }
}

extension String {
    public func toAttributedString() -> AttributedString {
        return AttributedString(toNsAttributedString())
    }

    public func toNsAttributedString() -> NSAttributedString {
        return NSAttributedString(string: self)
    }
}
