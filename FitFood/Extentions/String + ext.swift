//
//  String + ext.swift
//  FitFood
//
//  Created by Habibur Rahman on 15/12/24.
//

import Foundation
import SwiftUI

extension String{
    
    public func toAttributedString() -> AttributedString {
        return AttributedString(self.toNsAttributedString())
    }
    
    public func toAttributedTextForPlaceHolder() -> AttributedString{
        let string = self
        let attributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: Color.gray, //Constants.ColorAsset.descriptionText,
        ]

        let attributedString = NSAttributedString(string: string, attributes: attributes)
        return  AttributedString(attributedString)
    }
    
    public func toNsAttributedString() -> NSAttributedString {
        let data = Data(self.utf8)
        if self.isEmpty {
            return NSAttributedString(string: self)
        }
        if let attributedString = try? NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html], documentAttributes: nil) {
            return attributedString
        }
        return NSAttributedString(string: self)
    }
    
}
