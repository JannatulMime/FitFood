//
//  DetailsRecipeView.swift
//  FitFood
//
//  Created by Habibur Rahman on 27/11/24.
//

import SwiftUI
import FitFoodCore
import RichTextKit

struct DetailsRecipeView: View {
    @State var isViewed = false
    @StateObject var vm: DetailsRecipeVM
    @StateObject var context = RichTextContext()
    @Environment(\.presentationMode) var presentationMode
    
    let topBarConfig = CommonTopBarData(title: "", bgColor: Color.clear, leftIconName: "chevron.left", rightIconName: "")
    
    init(recipe: Recipe) {
        _vm = StateObject(wrappedValue: DetailsRecipeVM(recipe: recipe))
    }

    
    
    var body: some View {
        NavigationStack {
           
            contentView
                
            
        }
    }
}

#Preview {
    DetailsRecipeView(recipe: dummyRecipe1)
}

extension DetailsRecipeView {
    
    var contentView: some View {
        ScrollView {
            VStack {
                HStack {
                    Image(vm.recipe?.image ?? "")
                        .resizable()
                        .frame(maxWidth: .infinity)
                        .frame(height: 300)
                        .scaledToFill()
                    
                }.overlay(
                    
                    CommonTopBarView(data: topBarConfig, onLeftButtonClicked:   {
                       
                        self.presentationMode.wrappedValue.dismiss()
                            
                    }
                    ).offset(y: -50)
                        .padding(.leading)
                       
                )
                
                VStack {
                    VStack (alignment : .leading, spacing: 30){
                        Spacer()
                            .frame(height: 0)
                        
                        recipeTitle
                        typeButton
                        roundedButton
                        ingredients
                        instructions
                    }
                    .padding(.horizontal, 15)
                   
                    Spacer()
                        .frame(height: 20)
                    
                }

              // .frame(maxHeight: .infinity)
                .background(Color.white)
                .cornerRadius(20)
                .shadow(color: Color.theme.darkGray, radius: 5, x: 0, y: 3)
                .offset(y:-70)
                .padding(.all, 20)
               
                
                
            }
           
            
           
        }
        .navigationBarBackButtonHidden(true)
        .ignoresSafeArea()
        
    }
    
   
    var recipeTitle: some View {
        HStack {
            Text(vm.recipe?.name  ?? "No data")
                .modifier(BoldFont(fontSize: FontSize.ExtraLarge.rawValue))
                .foregroundStyle(Color.theme.darkOrange)
            
            Spacer()
            
            ZStack {
                Circle()
                    .fill(Color.white)
                    .shadow(color: Color.theme.lightGray, radius: 2, x: 0, y: 1)
                
                Image(systemName: "heart")
                    .resizable()
                    .frame(width: 20, height: 20)
                   
                   .foregroundStyle(Color.theme.mediumOrange)
                
            }.frame(width: 40, height: 40)
                
                
        }
    }
    
    var typeButton: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 10) {
                ForEach(vm.getTags()) { tag in
                    TextInCapsule(text: tag.title)
                }
            }
        }
    }
    
    var roundedButton: some View {

        HStack(spacing: 25) {
            SingleRoundedButton(text: "Calories", textOutput: vm.recipe?.calories ?? "No data")
            SingleRoundedButton(text: "Time", textOutput: vm.recipe?.time ?? "No data")
            SingleRoundedButton(text: "Rating", textOutput: vm.recipe?.getFormatedRating() ?? "")
        }
    }
    
    var ingredients: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text ("Ingredients")
                .modifier(SemiBoldFont(fontSize: FontSize.Regular.rawValue))
//                .foregroundStyle(Color.theme.darkGray)
                .foregroundStyle(Color.black)
            
            
            ForEach(vm.getIngrediants(), id: \.self) { singleIngredient in
                HStack(spacing: 15) {
                    Image(systemName: "checkmark.seal")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .foregroundStyle(Color.theme.mediumOrange)
                    
                    Text(singleIngredient)
                        .modifier(RegularFont(fontSize: FontSize.Small.rawValue))
                        .foregroundStyle(Color.black)
                    
                }
            }
            
           
        }
    }
    
    var instructions: some View {
        VStack(alignment: .leading, spacing: 5) {
            
           
           Text ("Instructions")
                .modifier(SemiBoldFont(fontSize: FontSize.Regular.rawValue))
                .foregroundStyle(Color.theme.darkGray)
            
            
        
            
          Text(AttributedString(vm.getDescription()))
//            RichTextViewer( vm.getDescription())
//                .frame(height: 200)
//                .modifier(LightFont(fontSize: FontSize.Small.rawValue))
//                .multilineTextAlignment(.leading)
//                .lineLimit(isViewed ? 20 : 3)
            
            Button(isViewed ? "Read Less" : "Read More") {
                    isViewed.toggle()
            }
            .modifier(SemiBoldFont(fontSize: FontSize.Small.rawValue))
            .foregroundStyle(Color.theme.merun)
        }
    }
}
