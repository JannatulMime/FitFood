//
//  TextInCapsule.swift
//  FitFood
//
//  Created by Habibur Rahman on 27/11/24.
//

import SwiftUI

struct TextInCapsule: View {
    var text: String
    
    var body: some View {
        
        Text(text)
            .modifier(SemiBoldFont(fontSize: FontSize.Small.rawValue))
            .foregroundStyle(.white)
            .frame(height: 10)
            .padding(10)
            .background(Color.theme.lightOrange)
            .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

#Preview {
    TextInCapsule(text: "Lunch")
}
