//
//  HomeVM.swift
//  FitFood
//
//  Created by Habibur Rahman on 3/12/24.
//

import Foundation

import FirebaseHelper
import FitFoodCore


class HomeVM: ObservableObject {
    @Published var goToDetailsPage: Bool = false
    @Published var selectedRecipe: FitFoodCore.Recipe?
    @Published var goToProfileView: Bool = false
    
    @Published var popularRecipe: [FitFoodCore.Recipe] = []
    
    let firebaseRecipeManager = FirebaseRecipeManager(root: "Test")
    
    init() {
        Task{
            let popularRecipeResult = await firebaseRecipeManager.fetchDataList()
            if let recipes = popularRecipeResult.0 {
                popularRecipe = recipes 
            }
            
        }
       
    }
}
