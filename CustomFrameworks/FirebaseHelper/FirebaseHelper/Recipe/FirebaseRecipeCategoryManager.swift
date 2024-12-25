//
//  Catego.swift
//  FirebaseHelper
//
//  Created by Habibur Rahman on 9/12/24.
//


import FirebaseFirestore
import FitFoodCore
import Foundation

public class FirebaseRecipeCategoryManager {
    
    public typealias CreateResult = (String?, Error?)
    public typealias FetchListResult = ([RecipeCategory]?, Error?)

    let firestore = Firestore.firestore()
    let collectionRef: CollectionReference

    public init(root: String) {
        collectionRef = firestore.collection(root).document("Category").collection("list")
    }

//    public func addCategoryList(catList: [RecipeCategory]) async -> CreateResult {
//        do {
//            let  = recipe.toDictionary()
//            let ref = try await collectionRef.addDocument(data: data)
//            //  print("Success creating recipe")
//            return (ref.documentID, nil)
//        } catch {
//            // print("in catch")
//            return (nil, error)
//        }
//    }
    
    public func addSingleData(id : String, data: [String: Any]) async -> CreateResult {
        do {
           // let data = category.toDictionary()
            _ = try await collectionRef.document(id).setData(data)
            return (id, nil)
        } catch {
            // print("in catch")
            return (nil, error)
        }
    }

    public func fetchDataList() async -> FetchListResult {
        do {
            let snapshot = try await collectionRef.getDocuments()
            let codableList: [RecipeCategoryCodable] = try snapshot.decoded()
            let categoryList: [RecipeCategory] = codableList.map { $0.toRecipeCategory() }

            print("datas count \(codableList.count)")

            for data in categoryList {
                print("data", data)
            }

            return (categoryList, nil)
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


