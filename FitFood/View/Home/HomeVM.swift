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
            
            
            if let recipes = try? popularRecipeResult.get() {
                DispatchQueue.main.async {
                    let a : [RecipeCodable]? = try? recipes.toModel().get()
                    self.popularRecipe = a?.map{$0.toRecipe()} ?? []
                }
            }
            
        }
       
    }
}

class FetchRecipeService {
    let firebaseRecipeManager = FirebaseRecipeManager(root: "Test")
//    func getPopularRecipeList() async throws -> [Recipe] {
//        
//    }
}




