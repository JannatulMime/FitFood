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
    
    public typealias Result = (String?, Error?)

    let firestore = Firestore.firestore()
    let collectionRef: CollectionReference

    public init(root: String) {
        collectionRef = firestore.collection(root).document("Recipes").collection("list")
    }

    public func addData(recipe: Recipe) async -> Result {
        do {
            let data = recipe.toDictionary()
            let ref = try await collectionRef.addDocument(data: data)
            //  print("Success creating recipe")
            return (ref.documentID, nil)
        } catch {
            // print("in catch")
            return (nil, error)
        }
    }

    public func fetchDataList() {
        var datas = [RecipeCodable]()
        collectionRef.getDocuments { snapshot, _ in
            do {
                datas = try snapshot?.decoded() ?? []
                print("datas count \(datas.count)")

                for data in datas {
                    print("data", data)
                }
            } catch {
            }
        }
    }
}

extension Recipe {
    func toCodableRecipe() -> RecipeCodable {
        RecipeCodable(id: id, name: name, ingredients: ingredients, instructions: instructions, image: image, category: category.rawValue, rating: rating, time: time, calories: calories, tags: tags.map { $0.toTagCodable() })
    }

    func toDictionary() -> [String: Any] {
        let dicData = toCodableRecipe().toDictionary() ?? [:]

        print(dicData)
        return dicData
    }
}
