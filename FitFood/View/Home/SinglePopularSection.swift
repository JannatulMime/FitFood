//
//  SinglePopularSection.swift
//  FitFood
//
//  Created by Habibur Rahman on 30/11/24.
//

import SwiftUI

struct SinglePopularSection: View {
    var recipeName: String
    
    var body: some View {
        VStack {
            Image("Orange")
                .resizable()
                .frame(width: 100, height: 100)
                .clipShape(.circle)
                .scaledToFill()
            
            Text(recipeName)
                .modifier(SemiBoldFont(fontSize: FontSize.Small.rawValue))
                .foregroundColor(Color.theme.mediumOrange)
            
            
               
        } .frame(width: 150, height: 200)
            .background(Color.white)
          .cornerRadius(8)
          .shadow(color: Color.theme.lightGray, radius: 8, x: 0, y: 5)
                
            
            
    }
}

#Preview {
    SinglePopularSection(recipeName: "Healthy cookies")
    
}
