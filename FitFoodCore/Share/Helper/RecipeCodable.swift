//
//  RecipeCodable.swift
//  FirebaseHelper
//
//  Created by Habibur Rahman on 8/12/24.
//

import Foundation


public struct RecipeCodable: Codable, Identifiable {
    public let id: String
    let name: String
    let ingredients: [String]
    let instructions: String
    let image: String
    let category: String
    let rating: Double
    let time: String
    let calories: String
    let tags: [TagCodable]
    
    public init(id: String, name: String, ingredients: [String], instructions: String, image: String, category: String, rating: Double, time: String, calories: String, tags: [TagCodable]) {
        self.id = id
        self.name = name
        self.ingredients = ingredients
        self.instructions = instructions
        self.image = image
        self.category = category
        self.rating = rating
        self.time = time
        self.calories = calories
        self.tags = tags
    }
}

extension RecipeCodable {
    public func toRecipe() -> Recipe {
        // let recipeCategory : Category = Category(rawValue: category)

        Recipe(id: id, name: name, ingredients: ingredients, instructions: instructions, image: image, category: catBreakfast, rating: rating, time: time, calories: calories, tags: tags.map { $0.toTag() })
    }
}



public struct TagCodable : Codable {
    public let id : String
    public let title : String
    
    public func toTag() -> RecipeTag {
        return RecipeTag(id: id, title: title)
    }
}

extension RecipeTag{
    public func toTagCodable() -> TagCodable{
        TagCodable(id: id, title: title)
    }
}


