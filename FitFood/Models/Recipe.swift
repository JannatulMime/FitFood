//
//  Recipe.swift
//  FitFood
//
//  Created by Habibur Rahman on 30/11/24.
//

import Foundation

enum Category: String {
    case breakfast = "Breakfast"
    case lunch = "Lunch"
    case dinner = "Dinner"
    case snacks = "Snacks"
    case drinks = "Drinks"
    case dessert = "Dessert"
    case salad = "Salad"
}

struct Recipe: Identifiable {
    let id = UUID()
    let name: String
    let ingredients: [String]
    let instructions: String
    let image: String
    let category: Category
    let rating: Double
    let time: String
    let calories: Double
}

let dummyIngredients : [String] = ["Hodlud", "Sugar"]
//let dummyRecipe1 = Recipe(name: <#T##String#>, ingredients: <#T##[String]#>, instructions: <#T##String#>, image: <#T##String#>, category: <#T##Category#>, rating: <#T##Double#>, time: <#T##String#>, calories: <#T##Double#>)
