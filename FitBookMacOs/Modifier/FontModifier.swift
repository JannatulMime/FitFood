//
//  FontModifier.swift
//  FitBookMacOs
//
//  Created by Habibur Rahman on 11/12/24.
//

import SwiftUI

struct CustomTextModifier : ViewModifier {
   
    var fontSize: CGFloat
    var color : Color
    var weight: Font.Weight
    
    init(fontSize: CGFloat, color: Color, weight: Font.Weight) {
        self.fontSize = fontSize
        self.color = color
        self.weight = weight
    }
    
    func body(content: Content) -> some View {
        content
            .font(.system(size: fontSize))
            .foregroundColor(color)
            .fontWeight(weight)
    }
}
