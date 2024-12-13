//
//  DetailsRecipeVM.swift
//  FitFood
//
//  Created by Habibur Rahman on 3/12/24.
//

import Foundation
import FitFoodCore

class DetailsRecipeVM: ObservableObject {
    
    @Published var recipe: Recipe?
   
    
    init(recipe: Recipe) {
        self.recipe = recipe
       // print("Received rcipe id  : \(recipe.id)")
       
    }
    
    func getIngrediants() -> [String] {
        return recipe?.ingredients ?? []
    }
    
    func getTags() -> [RecipeTag] {
        return recipe?.tags ?? []
    }
    
}
