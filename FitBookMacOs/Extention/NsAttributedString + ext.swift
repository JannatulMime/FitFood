//
//  NsAttributedString + ext.swift
//  FitBookMacOs
//
//  Created by Habibur Rahman on 16/12/24.
//

import Foundation

extension NSAttributedString {
    func toHtml() -> String? {
        let documentAttributes = [NSAttributedString.DocumentAttributeKey.documentType: NSAttributedString.DocumentType.html]
        do {
            let htmlData = try data(from: NSMakeRange(0, length), documentAttributes: documentAttributes)
            if let htmlString = String(data: htmlData, encoding: String.Encoding.utf8) {
                //  print("U>> compl - \(htmlString)")
                return htmlString
            }
        } catch {
            //  print("U>> error creating HTML from Attributed String")
        }
        return nil
    }
}
