//
//  DetailsRecipeView.swift
//  FitFood
//
//  Created by Habibur Rahman on 27/11/24.
//

import SwiftUI

struct DetailsRecipeView: View {
    @State var isViewed = false
    
    var body: some View {
        ScrollView {
            VStack {
                Image("Applepie")
                    .resizable()
                    .frame(maxWidth: .infinity)
                    .frame(height: 300)
                    .scaledToFill()
                
                // Spacer()
                
                VStack(alignment: .leading, spacing: 20) {
                    Spacer()
                    recipeTitle
                    typeButton
                    roundedButton
                    ingredients
                    instructions
                    Spacer()
                        .frame(height: 50)
                    
                }
                .frame(maxHeight: .infinity)
                .padding(.all, 15)
                .background(Color.white)
                
                .cornerRadius(20)
                .shadow(color: Color.theme.darkGray, radius: 5, x: 0, y: 3)
                .offset(y:-70)
                .padding(.horizontal, 20)
                
                
                
                Spacer()
                
            }
        }
        .ignoresSafeArea()
        
        
    }
}

#Preview {
    DetailsRecipeView()
}

extension DetailsRecipeView {
    var recipeTitle: some View {
        HStack {
            Text("Fruit Dessert")
                .modifier(BoldFont(fontSize: FontSize.ExtraLarge.rawValue))
                .foregroundStyle(Color.theme.darkOrange)
                .lineLimit(2)
            
            Spacer()
            
            Image(systemName: SystemImage.heart_fill )
                .resizable()
                .frame(width: 23, height: 20)
                .foregroundStyle(Color.theme.red)
        }
    }
    
    var typeButton: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 10) {
                ForEach(0..<5) { type in
                    TextInCapsule(text: "Dinner")
                }
            }
        }
    }
    
    var roundedButton: some View {
        HStack(spacing: 25){
            ForEach(0..<3) { type in
                SingleRoundedButton(text: "Time", textOutput: "30min")
            }
        }
    }
    
    var ingredients: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text ("Ingredients")
                .modifier(SemiBoldFont(fontSize: FontSize.Regular.rawValue))
                .foregroundStyle(Color.theme.darkGray)
            
            ForEach(0..<5) { type in
                HStack {
                    Image(systemName: "checkmark.seal.fill")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .foregroundStyle(Color.theme.mediumOrange)
                    
                    Text("200g orange fruit plump")
                        .modifier(LightFont(fontSize: FontSize.Small.rawValue))
                    
                }
            }
            
           
        }
    }
    
    var instructions: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text ("Instructions")
                .modifier(SemiBoldFont(fontSize: FontSize.Regular.rawValue))
                .foregroundStyle(Color.theme.darkGray)
            
            Text("Bring the fruit to a simmer and cook for 10 minutes until tender. Remove from the heat and let cool. Blend until smooth. Serve immediately. (This recipe makes about 1.5 cups of pureed fruit. You can also use this pureed fruit to make a fruit salad or ice cream. The pureed fruit can be stored in the refrigerator for up to 3 days.")
                .modifier(LightFont(fontSize: FontSize.Small.rawValue))
                .multilineTextAlignment(.leading)
                .lineLimit(isViewed ? 20 : 3)
            
            Button(isViewed ? "Read Less" : "Read More") {
               
                    isViewed.toggle()
            }
            .modifier(SemiBoldFont(fontSize: FontSize.Small.rawValue))
            .foregroundStyle(Color.theme.red)
        }
    }
}
