//
//  DetailsRecipeVM.swift
//  FitFood
//
//  Created by Habibur Rahman on 3/12/24.
//

import Foundation

class DetailsRecipeVM: ObservableObject {
    
    @Published var recipe: Recipe?
    
    init(recipeId: String) {
        print("Received rcipe id  : \(recipeId)")
       
    }
}
