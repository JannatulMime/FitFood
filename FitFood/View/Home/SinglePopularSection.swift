//
//  SinglePopularSection.swift
//  FitFood
//
//  Created by Habibur Rahman on 30/11/24.
//

import SwiftUI

struct SinglePopularSection: View {
    var recipeImage: String
    var recipeName: String
    var calories: String
    var time: String
    
    var body: some View {
        VStack {
            Spacer()
            
            Image(recipeImage)
                .resizable()
                .frame(width: 80, height: 80)
                .clipShape(.circle)
                .scaledToFill()
            
            VStack(alignment: .leading, spacing: 0) {
                Text(recipeName)
                    .modifier(SemiBoldFont(fontSize: FontSize.ExtraSmall.rawValue))
                    .foregroundColor(Color.theme.darkOrange)
                
                Text(calories)
                    .modifier(LightFont(fontSize: FontSize.ExtraSmall.rawValue))
                    .foregroundColor(Color.theme.darkGray)
                
                Spacer()
                    
                
                viewAndDuration
                    .padding(.bottom, 10)
            }.padding(.all, 10)
            
        }.frame(width: 140, height: 200)
            .background(Color.white)
          .cornerRadius(8)
          .shadow(color: Color.theme.lightGray, radius: 5, x: 0, y: 1)
         
            
            
    }
}

#Preview {
    SinglePopularSection(recipeImage: "Orange", recipeName: "Healthy cookies", calories: "250cal", time: "15min")
    
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
                
                Text(time)
                    .modifier(LightFont(fontSize: FontSize.ExtraSmall.rawValue))
                    .foregroundStyle(Color.theme.mediumGray)
                
            }
        }
    }
        
    }
