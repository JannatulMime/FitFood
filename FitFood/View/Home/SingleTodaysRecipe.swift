//
//  SingleTodaysRecipe.swift
//  FitFood
//
//  Created by Habibur Rahman on 1/12/24.
//

import SwiftUI

struct SingleTodaysRecipe: View {
    var recipeImage: String
    var recipeName: String
    var calories: String
    var time: String
    
    var body: some View {
        HStack {
            Image(recipeImage)
                .resizable()
                .frame(width: 50, height: 50)
                .clipShape(.buttonBorder)
                .scaledToFill()
            
            VStack(alignment: .leading, spacing: 0) {
                Text(recipeName)
                    .modifier(SemiBoldFont(fontSize: FontSize.ExtraSmall.rawValue))
                    .foregroundStyle(Color.theme.darkOrange)
                
                HStack(spacing: 10) {
                    Text(calories)
                        .modifier(LightFont(fontSize: FontSize.ExtraSmall.rawValue))
                        .foregroundStyle(Color.theme.darkGray)
                    
                    HStack(spacing: 5) {
                        Image(systemName: "clock.fill")
                            .resizable()
                            .frame(width: 10, height: 10)
                            .foregroundStyle(Color.theme.mediumOrange)
                        
                        Text(time)
                            .modifier(LightFont(fontSize: FontSize.ExtraSmall.rawValue))
                            .foregroundStyle(Color.theme.lightGray)
                        
                    }
                    
                }
                
            }
            Spacer()
            
            VStack {
                
                Image(systemName: "bookmark.fill")
                    .resizable()
                    .frame(width: 15, height: 20)
                    .foregroundStyle(Color.theme.mediumOrange)
                
              
                    Text("Breakfast")
                        .modifier(LightFont(fontSize: FontSize.ExtraSmall.rawValue))
                        .frame(maxWidth: .infinity)
                        .frame(height: 20)
                        .foregroundStyle(Color.theme.darkGray)
                       
//                        .background(RoundedRectangle(cornerRadius: 6).fill(.white).border(.lightGray))
//                
                
            }
        }
        .padding()
    }
}

#Preview {
    SingleTodaysRecipe(recipeImage: "Orange", recipeName: "Blueberry Cookies", calories: "240cal", time: "15min")
}
