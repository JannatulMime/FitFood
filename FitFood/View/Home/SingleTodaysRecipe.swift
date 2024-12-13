//
//  SingleTodaysRecipe.swift
//  FitFood
//
//  Created by Habibur Rahman on 1/12/24.
//

import SwiftUI
import FitFoodCore

struct SingleTodaysRecipe: View {

    let recipe: Recipe
    @State var isFavorite: Bool = false
    

    var body: some View {
        HStack {
          //  Image(recipeImage)
            Image(recipe.image)
                .resizable()
                .frame(width: 50, height: 50)
                .clipShape(.buttonBorder)
                .scaledToFit()

            profileNameAndImage
            Spacer()
            bookmarkAndCatagory
        }.frame(height: 80)
        .padding(.horizontal, 15)
        .background(RoundedRectangle(cornerRadius: 10).fill(.white)
                     //.shadow(color: Color.theme.lightGray, radius: 5, x: -2, y: 3)
                     .strokeBorder(Color.theme.lightGray, lineWidth: 0.8)
                 )
       // .shadow(color: Color.theme.lightGray, radius: 3, x: 0, y: 1)

       
    }
}

#Preview {
    SingleTodaysRecipe(recipe: dummyRecipe1)
}

extension SingleTodaysRecipe {
    var profileNameAndImage: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text(recipe.name)
                .modifier(SemiBoldFont(fontSize: FontSize.Small.rawValue))
                .foregroundStyle(Color.theme.darkOrange)

            HStack(spacing: 20) {
                Text(recipe.calories)
                    .modifier(SemiBoldFont(fontSize: FontSize.ExtraSmall.rawValue))
                    .foregroundStyle(Color.theme.mediumGray)

              
                HStack(spacing: 5) {
                    Image(systemName: "clock.fill")
                        .resizable()
                        .frame(width: 12, height: 12)
                        .foregroundStyle(Color.theme.mediumOrange)

                    Text(recipe.time)
                        .modifier(LightFont(fontSize: FontSize.ExtraSmall.rawValue))
                        .foregroundStyle(Color.theme.mediumGray)
                }
            }
        }
    }

    var bookmarkAndCatagory: some View {
        VStack(alignment: .trailing) {
            ZStack {
                Circle()
                    .fill(Color.white)
                    .shadow(color: Color.theme.lightGray, radius: 2, x: 0, y: 1)
                
                Image(systemName: isFavorite ? "heart.fill" : "heart")
                    .resizable()
                    .frame(width: 20, height: 20)
                   
                   .foregroundStyle(Color.theme.mediumOrange)
                
            }.frame(width: 40, height: 40)
                .onTapGesture {
                    isFavorite.toggle()
                }
                
                
            Text(recipe.category.rawValue)
                .modifier(LightFont(fontSize: FontSize.ExtraSmall.rawValue))
                .foregroundStyle(Color.theme.darkGray)

        }
    }
}
