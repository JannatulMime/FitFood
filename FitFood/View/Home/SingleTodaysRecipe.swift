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
    SingleTodaysRecipe(recipeImage: "Orange", recipeName: "Blueberry Cookies", calories: "240cal", time: "15min")
}

extension SingleTodaysRecipe {
    var profileNameAndImage: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text(recipeName)
                .modifier(SemiBoldFont(fontSize: FontSize.Small.rawValue))
                .foregroundStyle(Color.theme.darkOrange)

            HStack(spacing: 20) {
                Text(calories)
                    .modifier(SemiBoldFont(fontSize: FontSize.ExtraSmall.rawValue))
                    .foregroundStyle(Color.theme.mediumGray)

              
                HStack(spacing: 5) {
                    Image(systemName: "clock.fill")
                        .resizable()
                        .frame(width: 12, height: 12)
                        .foregroundStyle(Color.theme.mediumOrange)

                    Text(time)
                        .modifier(LightFont(fontSize: FontSize.ExtraSmall.rawValue))
                        .foregroundStyle(Color.theme.mediumGray)
                }
            }
        }
    }

    var bookmarkAndCatagory: some View {
        VStack(alignment: .trailing) {
            Image(systemName: "bookmark.fill")
                .resizable()
                .frame(width: 15, height: 20)
                .foregroundStyle(Color.theme.mediumOrange)

            Text("Breakfast")
                .modifier(LightFont(fontSize: FontSize.ExtraSmall.rawValue))
                .foregroundStyle(Color.theme.darkGray)

        }
    }
}
