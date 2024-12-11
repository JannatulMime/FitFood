//
//  String + Ext.swift
//  FitBookMacOs
//
//  Created by Habibur Rahman on 11/12/24.
//

import Foundation
import SwiftUICore


extension String {
    
    func toInt() -> Int?{
        return Int(self)
    }
}


extension String{
    
    func toAttributedString() -> AttributedString {
        return AttributedString(self.toNsAttributedString())
    }
    
    func toAttributedTextForPlaceHolder() -> AttributedString{
        let string = self
        let attributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: Color.gray, //Constants.ColorAsset.descriptionText,
        ]

        let attributedString = NSAttributedString(string: string, attributes: attributes)
        return  AttributedString(attributedString)
    }
    
    func toNsAttributedString() -> NSAttributedString {
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
