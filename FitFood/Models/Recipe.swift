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

struct Tag : Identifiable {
    let id : String
    let title : String
}

struct Recipe: Identifiable {
    let id: String = UUID().uuidString
    let name: String
    let ingredients: [String]
    let instructions: String
    let image: String
    let category: Category
    let rating: Double
    let time: String
    let calories: String
    let tags : [Tag]
}

extension Recipe {
    func getFormatedRating() -> String {
        String(rating) + " / 5"
    }
    
    func getCategoryText() -> String{
        return category.rawValue
    }
}

let dummyTags : [Tag] = [
    Tag(id: "1", title: "Desert"),
    Tag(id: "2", title: "Drinks"),
    Tag(id: "3", title: "Breakfast"),
    Tag(id: "4", title: "Non Sugar")
]


let dummyRecipe1 = Recipe(name: "Egg Pudding", ingredients: ["1 liter Milk", "4 Eggs", "200g Sugar"], instructions: "Firstly put some eggs and mixed with sugar. Then add milk and mix well. Trun on the stove and cook until the pudding is thick. Then add some chocolate chips and mix well. Around 30 mins cook the pudding is ready. Then cool down of it. Serve it into chilled and enjoy..", image: "Pudding", category: Category.dessert, rating: 4.5, time: "30min", calories: "1890cal", tags: dummyTags)

let dummyRecipe2 = Recipe(name: "Chocolate Cake", ingredients: ["2 cup milk", "2 cup sugar", "2 cup flour", "backing powder", "eggs", "chocolate chips", "baking soda", "salt"], instructions: "2 cup of baking soda and salt are used to make the cake. 2 cup of flour and backing powder, backing powder and salt are used to make the cake. 2 cup of sugar and milk are used to make the cake. 2 cup of eggs are used to make the cake. 2 cup of chocolate chips are used to make the cake on strove or the oven. Around 40 mins bake it and cake is reday to eat.", image: "Cake", category: Category.dessert, rating: 4.2, time: "40min", calories: "2500cal", tags: dummyTags)

let dummyRecipe3 = Recipe(name: "Rice Bowl", ingredients: ["Boiled rice", "Chicken", "Vegetables", "Sauce", "Onion", "Garlic","salt","pepper"], instructions: "Take a pan and add some oil. Then add some onion and garlic. Then add some salt and pepper. Then add some chicken. Then add some vegetables. Then add some sauce. Then add some boiled rice. Then mix well. Then serve it into a bowl. Enjoy..", image: "Rice", category: Category.lunch, rating: 3.7, time: "15min", calories: "1150cal",  tags: dummyTags)

let dummyRecipe4 = Recipe(name: "Chicken Fry", ingredients: ["Chicken", "Oil", "Spaices"], instructions: "First of all cut the chicken into small pieces. Then add some oil. Then add some spices and salt. Then fry it until the chicken is completely trun into brown. Then serve it on Plate and here is it go Enjoy..", image: "Chicken", category: Category.snacks, rating: 4.8, time: "50min", calories: "1500cal",  tags: dummyTags)

let dummyRecipe5 = Recipe(name: "Sandwich", ingredients: ["Slice of 4 bread", "Onion", "Latuce Leaf", "Tommato", "Chicken", "Sauce"], instructions: "Take a slice of bread and add split of sauces on bread. Add some round slice onion. Then add some latuce leaf. Then add round slice tomato. And top of lots of boiled or fried chicken. Then add some salt and pepper. Then another piece of bread put on it and serve. Enjoy..", image: "Sandwich", category: Category.breakfast, rating: 4.9, time: "10min", calories: "690cal", tags: dummyTags)


let dummyRecipe6 = Recipe(name: "Blueberry cake", ingredients: ["1 cup berry", "2 cup flour", "1 cup sugar", "1 cup milk", "1 teaspoon baking soda", "1 teaspoon salt", "1 teaspoon vanilla extract"], instructions: "Firstly 2 cup of baking soda and salt are used to make the cake. 2 cup of flour and backing powder, backing powder and salt are used to make the cake. 1 cup of sugar and milk are used to make the cake. 1 teaspoon of vanilla extract is used to make the cake. 1 cup of berry is used to make the cake. Then mix all the ingredients well. Then put the mixture in a baking dish. Then bake it in a preheated oven at 180°C for  time. Then serve it. ", image: "Berry cake", category: Category.dessert, rating: 4.8, time: "50min", calories: "4690cal",  tags: dummyTags)
