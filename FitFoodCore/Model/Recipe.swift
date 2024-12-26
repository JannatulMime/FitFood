//
//  Recipe.swift
//  FitFood
//
//  Created by Habibur Rahman on 30/11/24.
//

import Foundation

public enum Category: String {
    case breakfast = "Breakfast"
    case lunch = "Lunch"
    case dinner = "Dinner"
    case snacks = "Snacks"
    case drinks = "Drinks"
    case dessert = "Dessert"
    case salad = "Salad"
    case unknown = ""
}

public struct RecipeCategory : Hashable {
    public var id : String
    public let title : String
    public let imageUrl : String
    
    public init(id: String, title: String, imageUrl: String) {
        self.id = id
        self.title = title
        self.imageUrl = imageUrl
    }
}

public struct RecipeCategoryCodable : Codable {
    public let id : String
    public let title : String
    public let imageUrl : String
}

extension RecipeCategoryCodable {
    public func toRecipeCategory() -> RecipeCategory {
        RecipeCategory(id: id, title: title, imageUrl: imageUrl)
    }
}


extension RecipeCategory {
   
   public func toCodable() -> RecipeCategoryCodable {
        RecipeCategoryCodable(id: id, title: title, imageUrl: imageUrl)
    }

   public func toDictionary() -> [String: Any] {
        let dicData = toCodable().toDictionary() ?? [:]

        print(dicData)
        return dicData
    }
}




public struct RecipeTag : Identifiable {
    public let id : String
    public let title : String
    
    public init(id: String, title: String) {
        self.id = id
        self.title = title
    }
}

public struct Recipe: Identifiable {
    public var id: String
    public let name: String
    public let ingredients: [String]
    public let instructions: String
    public let image: String
    public let category: RecipeCategory
    public let rating: Double
    public let time: String
    public let calories: String
    public let tags : [RecipeTag]
    
    public init(id : String, name: String, ingredients: [String], instructions: String, image: String, category: RecipeCategory, rating: Double, time: String, calories: String, tags: [RecipeTag]) {
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

extension Recipe {
    public func toCodableRecipe() -> RecipeCodable {
        RecipeCodable(id: id, name: name, ingredients: ingredients, instructions: instructions, image: image, category: category.title, rating: rating, time: time, calories: calories, tags: tags.map { $0.toTagCodable() })
    }

    public func toDictionary() -> [String: Any] {
        let dicData = toCodableRecipe().toDictionary() ?? [:]

        print(dicData)
        return dicData
    }
}

extension Recipe {
    public func getFormatedRating() -> String {
        String(rating) + " / 5"
    }
    
    public func getCategoryText() -> String {
        return category.title
    }
}

//extension Recipe {
//    func toCodableRecipe() -> RecipeCodable {
//        RecipeCodable(id: id, name: name, ingredients: ingredients, instructions: instructions, image: image, category: category.rawValue, rating: rating, time: time, calories: calories, tags: tags.map { $0.id })
//    }
//    
//    func toDictionary() -> [String: Any] {
//       let dicData = toCodableRecipe().toDictionary() ?? [:]
//    
//        print(dicData)
//        return dicData
//    }
//}




public let dummyTags1 : [RecipeTag] = [
    RecipeTag(id: "1", title: "Dessert"),
    RecipeTag(id: "2", title: "Milk"),
    RecipeTag(id: "3", title: "Sugar")
]

let dummyTags2 : [RecipeTag] = [
    RecipeTag(id: "1", title: "Onion"),
    RecipeTag(id: "2", title: "Breakfast"),
    RecipeTag(id: "3", title: "Chicken"),
    RecipeTag(id: "4", title: "Tommato")
]

let dummyTags3 : [RecipeTag] = [
    RecipeTag(id: "1", title: "Lunch"),
    RecipeTag(id: "2", title: "Chicken"),
    RecipeTag(id: "3", title: "Vegtables"),
   
]

public let catBreakfast = RecipeCategory(id: "1", title: "Breakfast", imageUrl: "")
public let catLunch = RecipeCategory(id: "2", title: "Lunch", imageUrl: "")
public let catDinner = RecipeCategory(id: "3", title: "Dinner", imageUrl: "")
 
public let dummyRecipe1 = Recipe(id: UUID().uuidString, name: "Egg Pudding", ingredients: ["1 liter Milk", "4 Eggs", "200g Sugar"], instructions: "Firstly put some eggs and mixed with sugar. Then add milk and mix well. Trun on the stove and cook until the pudding is thick. Then add some chocolate chips and mix well. Around 30 mins cook the pudding is ready. Then cool down of it. Serve it into chilled and enjoy..", image: "Pudding", category: catBreakfast, rating: 4.5, time: "30min", calories: "1890cal", tags: dummyTags1)

public let dummyRecipe2 = Recipe(id: UUID().uuidString,name: "Chocolate Cake", ingredients: ["2 cup milk", "2 cup sugar", "2 cup flour", "backing powder", "eggs", "chocolate chips", "baking soda", "salt"], instructions: "2 cup of baking soda and salt are used to make the cake. 2 cup of flour and backing powder, backing powder and salt are used to make the cake. 2 cup of sugar and milk are used to make the cake. 2 cup of eggs are used to make the cake. 2 cup of chocolate chips are used to make the cake on strove or the oven. Around 40 mins bake it and cake is reday to eat.", image: "Cake", category: catLunch, rating: 4.2, time: "40min", calories: "2500cal", tags: dummyTags1)

public let dummyRecipe3 = Recipe(id: UUID().uuidString,name: "Rice Bowl", ingredients: ["Boiled rice", "Chicken", "Vegetables", "Sauce", "Onion", "Garlic","salt","pepper"], instructions: "Take a pan and add some oil. Then add some onion and garlic. Then add some salt and pepper. Then add some chicken. Then add some vegetables. Then add some sauce. Then add some boiled rice. Then mix well. Then serve it into a bowl. Enjoy..", image: "Rice", category: catLunch, rating: 3.7, time: "15min", calories: "1150cal",  tags: dummyTags3)

public let dummyRecipe4 = Recipe(id: UUID().uuidString,name: "Chicken Fry", ingredients: ["Chicken", "Oil", "Spaices"], instructions: "First of all cut the chicken into small pieces. Then add some oil. Then add some spices and salt. Then fry it until the chicken is completely trun into brown. Then serve it on Plate and here is it go Enjoy..", image: "Chicken", category: catDinner, rating: 4.8, time: "50min", calories: "1500cal",  tags: dummyTags2)

public let dummyRecipe5 = Recipe(id: UUID().uuidString,name: "Sandwich", ingredients: ["Slice of 4 bread", "Onion", "Latuce Leaf", "Tommato", "Chicken", "Sauce"], instructions: "Take a slice of bread and add split of sauces on bread. Add some round slice onion. Then add some latuce leaf. Then add round slice tomato. And top of lots of boiled or fried chicken. Then add some salt and pepper. Then another piece of bread put on it and serve. Enjoy..", image: "Sandwich", category: catDinner, rating: 4.9, time: "10min", calories: "690cal", tags: dummyTags2)


public let dummyRecipe6 = Recipe(id: UUID().uuidString,name: "Blueberry cake", ingredients: ["1 cup berry", "2 cup flour", "1 cup sugar", "1 cup milk", "1 teaspoon baking soda", "1 teaspoon salt", "1 teaspoon vanilla extract"], instructions: "Firstly 2 cup of baking soda and salt are used to make the cake. 2 cup of flour and backing powder, backing powder and salt are used to make the cake. 1 cup of sugar and milk are used to make the cake. 1 teaspoon of vanilla extract is used to make the cake. 1 cup of berry is used to make the cake. Then mix all the ingredients well. Then put the mixture in a baking dish. Then bake it in a preheated oven at 180°C for  time. Then serve it. ", image: "Berry cake", category: catBreakfast, rating: 4.8, time: "50min", calories: "4690cal",  tags: dummyTags1)




