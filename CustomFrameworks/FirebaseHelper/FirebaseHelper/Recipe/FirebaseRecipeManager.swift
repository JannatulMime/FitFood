//
//  FirebaseRecipeManager.swift
//  FirebaseHelper
//
//  Created by Habibur Rahman on 8/12/24.
//

import FirebaseFirestore
import FitFoodCore
import Foundation

public class FirebaseRecipeManager {
    public typealias CreateResult = (String?, Error?)
    public typealias FetchListResult = ([Recipe]?, Error?)

    let firestore = Firestore.firestore()
    let collectionRef: CollectionReference

    public init(root: String) {
        collectionRef = firestore.collection(root).document("Recipes").collection("list")
    }

    public func addData(recipe: Recipe) async -> CreateResult {
        do {
            let data = recipe.toDictionary()
            let _ = try await collectionRef.document(recipe.id).setData(data)//documentRef.addDocument(data: data)
            return (recipe.id, nil)
        } catch {
            // print("in catch")
            return (nil, error)
        }
    }

    
    public func fetchDataList() async -> FetchListResult {
        do {
            let snapshot = try await collectionRef.getDocuments()
            let codableRecipeList: [RecipeCodable] = try snapshot.decoded()
            let recipeList: [Recipe] = codableRecipeList.map { $0.toRecipe() }

            print("datas count \(codableRecipeList.count)")

            for data in recipeList {
                print("data", data)
            }

            return (recipeList, nil)
        } catch {
            print("e \(error.localizedDescription)")
            return (nil, error)
        }

//        collectionRef.getDocuments { snapshot, _ in
//            do {
//                let codableRecipeList :  [RecipeCodable] = try snapshot?.decoded() ?? []
//                let recipeList : [Recipe] = codableRecipeList.map{$0.toRecipe()}
//               // print("datas count \(datas.count)")
//
//                return (recipeList, nil)
        ////                for data in datas {
        ////                    print("data", data)
        ////                }
//            } catch {
//                return (nil, error)
//            }
//        }
    }
}

extension RecipeCodable {
    func toRecipe() -> Recipe {
        // let recipeCategory : Category = Category(rawValue: category)

        Recipe(id: id, name: name, ingredients: ingredients, instructions: instructions.toNsAttributedString(), image: image, category: catBreakfast, rating: rating, time: time, calories: calories, tags: tags.map { $0.toTag() })
    }
}

extension Recipe {
    func toCodableRecipe() -> RecipeCodable {
        RecipeCodable(id: id, name: name, ingredients: ingredients, instructions: instructions.description, image: image, category: category.title, rating: rating, time: time, calories: calories, tags: tags.map { $0.toTagCodable() })
    }

    func toDictionary() -> [String: Any] {
        let dicData = toCodableRecipe().toDictionary() ?? [:]

        print(dicData)
        return dicData
    }
}
