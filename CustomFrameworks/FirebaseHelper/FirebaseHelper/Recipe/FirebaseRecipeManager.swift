//
//  FirebaseRecipeManager.swift
//  FirebaseHelper
//
//  Created by Habibur Rahman on 8/12/24.
//

import FirebaseFirestore
import FitFoodCore
import Foundation
import FirebaseDatabaseInternal

public class FirebaseRecipeManager {
    
   // public typealias CreateResult = (String?, Error?)
   // public typealias FetchListResult = Swift.Result<[[String: Any]],Error> //([Recipe]?, Error?)

    let firestore = Firestore.firestore()
    let collectionRef: CollectionReference

    public init(root: String) {
        collectionRef = firestore.collection(root).document("Recipes").collection("list")
    }

    public func addData(rootNode : String , data : [String: Any]) async -> FirebaseClient.CreateResult {
        do {
            print("data is - \(data)")
            let _ = try await collectionRef.document(rootNode).setData(data)//documentRef.addDocument(data: data)
            return .success(rootNode)
        } catch {
            // print("in catch")
            return .failure(error)
        }
    }

    
    public func fetchDataList() async -> FirebaseClient.FetchListResult {
        do {
            let snapshot = try await collectionRef.getDocuments()
            let data: [[String: Any]] = snapshot.documents.map { $0.data() }
            return .success(data)
        } catch {
            print("e \(error.localizedDescription)")
            return .failure(error)
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

//extension RecipeCodable {
//    func toRecipe() -> Recipe {
//        // let recipeCategory : Category = Category(rawValue: category)
//
//        Recipe(id: id, name: name, ingredients: ingredients, instructions: instructions, image: image, category: catBreakfast, rating: rating, time: time, calories: calories, tags: tags.map { $0.toTag() })
//    }
//}
//
//extension Recipe {
//    func toCodableRecipe() -> RecipeCodable {
//        RecipeCodable(id: id, name: name, ingredients: ingredients, instructions: instructions, image: image, category: category.title, rating: rating, time: time, calories: calories, tags: tags.map { $0.toTagCodable() })
//    }
//
//    func toDictionary() -> [String: Any] {
//        let dicData = toCodableRecipe().toDictionary() ?? [:]
//
//        print(dicData)
//        return dicData
//    }
//}
//



