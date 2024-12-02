//
//  SingleCatagoryButton.swift
//  FitFood
//
//  Created by Habibur Rahman on 30/11/24.
//

import SwiftUI

struct SingleCatagoryButton: View {
    var catagory: String
    var image: String
    
    var body: some View {
       
        HStack {
            Image(image)
                .resizable()
                .frame(width: 30, height: 30)
                .clipShape(.circle)
                .scaledToFit()
            
            Spacer()
            
            Text(catagory)
                .modifier(SemiBoldFont(fontSize: FontSize.Small.rawValue))
                .foregroundColor(Color.theme.mediumOrange)
            
            
        }.padding()
        .frame(height: 50)
        .background(RoundedRectangle(cornerRadius: 15).fill(.white)
            //.shadow(color: Color.theme.lightGray, radius: 5, x: -2, y: 3)
            .strokeBorder(Color.theme.lightGray, lineWidth: 0.8)
        )
        
    }
}

#Preview {
    SingleCatagoryButton(catagory: "Breakfast", image: "Orange")
}
