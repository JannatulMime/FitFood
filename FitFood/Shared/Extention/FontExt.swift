//
//  FontExt.swift
//  FitFood
//
//  Created by Habibur Rahman on 29/11/24.
//

import Foundation
import SwiftUI


extension Font {
    
    static let font = Parkinsans()
    
    struct Parkinsans {
        
        func regular(size : CGFloat) -> Font{
            return Font.custom(Fonts.parkinsansRegular, size: size)
        }
        
        func semiBold(size : CGFloat) -> Font{
            return Font.custom(Fonts.parkinsansRegular, size: size)
        }
    }
    
    struct SystemFont {
        
        func regular(size : CGFloat) -> Font{
            return Font.system(size: size)
        }
    }
}
