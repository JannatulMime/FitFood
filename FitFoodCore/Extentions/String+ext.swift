//
//  String+ext.swift
//  FitFoodCore
//
//  Created by Habibur Rahman on 14/12/24.
//

import Foundation
import SwiftUI

extension String {
    
    func toInt() -> Int?{
        return Int(self)
    }
}


extension String{
    
    public func toAttributedString() -> AttributedString {
        return AttributedString(self.toNsAttributedString())
    }
    
    
    public func toNsAttributedString() -> NSAttributedString {
        return NSAttributedString(string: self)
    }
    
}

//extension String{
//    
//    public func toAttributedString() -> AttributedString {
//        return AttributedString(self.toNsAttributedString())
//    }
//    
//    public func toAttributedTextForPlaceHolder() -> AttributedString{
//        let string = self
//        let attributes: [NSAttributedString.Key: Any] = [
//            .foregroundColor: Color.gray, //Constants.ColorAsset.descriptionText,
//        ]
//
//        let attributedString = NSAttributedString(string: string, attributes: attributes)
//        return  AttributedString(attributedString)
//    }
//    
//    public func toNsAttributedString() -> NSAttributedString {
//        let data = Data(self.utf8)
//        if self.isEmpty {
//            return NSAttributedString(string: self)
//        }
//        if let attributedString = try? NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html], documentAttributes: nil) {
//            return attributedString
//        }
//        return NSAttributedString(string: self)
//    }
//    
//}
//
