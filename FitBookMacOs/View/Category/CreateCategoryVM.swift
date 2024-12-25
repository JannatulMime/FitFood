//
//  CreateCategoryVM.swift
//  FitBookMacOs
//
//  Created by Habibur Rahman on 16/12/24.
//

import Foundation
import FirebaseHelper
import FitFoodCore


class CreateCategoryVM: ObservableObject {
    @Published var title: String = ""
    @Published var image: String? = ""
    @Published var pickedImage: Data?
    @Published var category: RecipeCategory?
    
    let firebaseCategoryManager = FirebaseRecipeCategoryManager(root: "Test")
   
    init(recipeCategory: RecipeCategory?) {
        
        if let category = recipeCategory {
            title = category.title
            image = category.imageUrl
        
        }
    }
    
    func saveCategory() {
        let newCategory = RecipeCategory(id: UUID().uuidString, title: title, imageUrl: image ?? "")
        let data = newCategory.toDictionary()
        
        Task{
            let result = await firebaseCategoryManager.addSingleData(id: newCategory.id, data: data)
           // print("created id is \(String(describing: result.0))  error \(String(describing: result.1?.localizedDescription))")
        }
       
        
    }

   
}
