//
//  FontExt.swift
//  FitFood
//
//  Created by Habibur Rahman on 29/11/24.
//

import Foundation
import SwiftUI


extension Font {
    
    static let font = SystemFont()
    
    struct Font1 {
        
        func regular(size : CGFloat) -> Font{
            return Font.custom(Fonts.outfitRegular, size: size)
        }
    }
    
    struct SystemFont {
        
        func regular(size : CGFloat) -> Font{
            return Font.system(size: size)
        }
    }
}
