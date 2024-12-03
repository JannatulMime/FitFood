//
//  DetailsRecipeView.swift
//  FitFood
//
//  Created by Habibur Rahman on 27/11/24.
//

import SwiftUI

struct DetailsRecipeView: View {
    @State var isViewed = false
    @StateObject var vm: DetailsRecipeVM
    
    @Environment(\.presentationMode) var presentationMode
    
    init(recipeId: String) {
        _vm = StateObject(wrappedValue: DetailsRecipeVM(recipeId: recipeId))
    }

    
    var body: some View {
        ScrollView {
            VStack {
                Image("Sandwich")
                    .resizable()
                    .frame(maxWidth: .infinity)
                    .frame(height: 300)
                    .scaledToFill()
                
                
                VStack(alignment: .leading, spacing: 30) {
                    Spacer()
                        .frame(height: 0)
                  
                    VStack (alignment : .leading){
                        recipeTitle
                        typeButton
                        roundedButton
                        ingredients
                        instructions
                    }
                    .padding(.horizontal,15)
                   
                    Spacer()
                        .frame(height: 20)
                    
                }

             //   .frame(maxHeight: .infinity)
 
                .background(Color.white)
                .cornerRadius(20)
                .shadow(color: Color.theme.darkGray, radius: 5, x: 0, y: 3)
                .offset(y:-70)
            
                .padding()
                
                
            }
        }
        .ignoresSafeArea()
        
        
    }
}

#Preview {
    DetailsRecipeView(recipeId: "")
}

extension DetailsRecipeView {
    var recipeTitle: some View {
        HStack {
            Text(vm.recipe?.name  ?? "No data")
                .modifier(BoldFont(fontSize: FontSize.ExtraLarge.rawValue))
                .foregroundStyle(Color.theme.darkOrange)
            
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
        VStack(alignment: .leading, spacing: 20) {
            Text ("Ingredients")
                .modifier(SemiBoldFont(fontSize: FontSize.Regular.rawValue))
                .foregroundStyle(Color.theme.darkGray)
            
            ForEach(0..<5) { type in
                HStack(spacing: 15) {
                    Image(systemName: "checkmark.seal")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .foregroundStyle(Color.theme.mediumOrange)
                    
                    Text("200g orange fruit plump")
                        .modifier(RegularFont(fontSize: FontSize.Small.rawValue))
                    
                }
            }
            
           
        }
    }
    
    var instructions: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text ("Instructions")
                .modifier(SemiBoldFont(fontSize: FontSize.Regular.rawValue))
                .foregroundStyle(Color.theme.darkGray)
            
            Text(vm.recipe?.instructions ?? "")
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
