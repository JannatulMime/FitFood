//
//  SinglePopularSection.swift
//  FitFood
//
//  Created by Habibur Rahman on 30/11/24.
//

import SwiftUI

struct SinglePopularSection: View {
    let recipe: Recipe
    
    var body: some View {
        VStack {
            Spacer()
                .frame(height: 15)
            
            Image(recipe.image)
                .resizable()
                .frame(width: 80, height: 80)
                .clipShape(.circle)
                .scaledToFit()
            
            VStack(alignment: .leading, spacing: 0) {
                Text(recipe.name)
                    .modifier(SemiBoldFont(fontSize: FontSize.Small.rawValue))
                    .foregroundColor(Color.theme.darkOrange)
                
                Text(recipe.calories)
                    .modifier(LightFont(fontSize: FontSize.ExtraSmall.rawValue))
                    .foregroundColor(Color.theme.darkGray)
                
                Spacer()
                    
                
                viewAndDuration
                    .padding(.bottom, 5)
            }.padding(.all, 10)
            
        }.frame(width: 150, height: 190)

          .background(RoundedRectangle(cornerRadius: 10).fill(.white)
              //.shadow(color: Color.theme.lightGray, radius: 5, x: -2, y: 3)
              .strokeBorder(Color.theme.lightGray, lineWidth: 0.8)
             // .shadow(color: Color.theme.lightGray, radius: 3, x: 0, y: 2)
          )
    }
}

#Preview {
    SinglePopularSection(recipe: dummyRecipe4)
    
}


extension SinglePopularSection {
    var viewAndDuration: some View {
        HStack {
            Button {
                
                
            } label: {
                Text("View")
                    .modifier(LightFont(fontSize: FontSize.ExtraSmall.rawValue))
                    .foregroundStyle(.white)
                    .frame(width: 50, height: 20)
                //.frame(maxWidth: .infinity)
                    .background(RoundedRectangle(cornerRadius: 10).fill(Color.theme.lightOrange))
                
            }
            
            Spacer()
            
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
