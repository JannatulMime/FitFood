//
//  FontModifier.swift
//  FitFood
//
//  Created by Habibur Rahman on 29/11/24.
//


import SwiftUI

struct RegularFont: ViewModifier {
    var fontSize: CGFloat
    func body(content: Content) -> some View {
        content
            .font(Font.font.light(size: fontSize))
//            .font(Font.font.regular(size: fontSize))
//            .font(Font.font.semiBold(size: fontSize))
//            .font(Font.font.bold(size: fontSize))
    }
}


struct LightFont: ViewModifier {
    var fontSize: CGFloat
    func body(content: Content) -> some View {
        content
            .font(Font.font.light(size: fontSize))
            
    }
}


struct SemiBoldFont: ViewModifier {
    var fontSize: CGFloat
    func body(content: Content) -> some View {
        content
            
            .font(Font.font.semiBold(size: fontSize))
           
    }
}


struct BoldFont: ViewModifier {
    var fontSize: CGFloat
    func body(content: Content) -> some View {
        content
            .font(Font.font.bold(size: fontSize))
    }
}




//struct SystemFontRegular: ViewModifier {
//    var fontSize: CGFloat
//    func body(content: Content) -> some View {
//        content
//            .font(Font.SystemFont().regular(size: fontSize))
//    }
//}
