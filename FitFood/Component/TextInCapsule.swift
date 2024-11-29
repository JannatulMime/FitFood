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
            .font(.caption)
            .fontWeight(.bold)
            .foregroundStyle(.white)
            .frame(height: 8)
            .padding(10)
            .background(Color.theme.lightOrange)
            .clipShape(RoundedRectangle(cornerRadius: 15))
    }
}

#Preview {
    TextInCapsule(text: "Lunch")
}
