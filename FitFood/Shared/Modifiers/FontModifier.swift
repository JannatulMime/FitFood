//
//  FontModifier.swift
//  FitFood
//
//  Created by Habibur Rahman on 29/11/24.
//


import SwiftUI

struct FontOutfitRegular: ViewModifier {
    var fontSize: CGFloat
    func body(content: Content) -> some View {
        content
            .font(Font.font.regular(size: fontSize))
    }
}

struct SystemFontRegular: ViewModifier {
    var fontSize: CGFloat
    func body(content: Content) -> some View {
        content
            .font(Font.SystemFont().regular(size: fontSize))
    }
}
