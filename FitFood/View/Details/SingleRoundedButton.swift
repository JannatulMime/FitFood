//
//  SingleRoundedButton.swift
//  FitFood
//
//  Created by Habibur Rahman on 29/11/24.
//

import SwiftUI

struct SingleRoundedButton: View {
    var text: String
    var textOutput: String
    
    var body: some View {
        VStack(alignment: .center) {
            Text(text)
                .font(.system(size: 13))
              
            Text(textOutput)
                .font(.system(size: 10))
                .foregroundStyle(Color.theme.darkOrange)
            
        }.frame(width: 100, height: 50)
        .background(RoundedRectangle(cornerRadius: 15).fill(.white)
            .shadow(color: Color.theme.lightGray, radius: 2, x: 0, y: 1)
        )
    }
}

#Preview {
    SingleRoundedButton(text: "Calarioes", textOutput: "1250cal")
}
