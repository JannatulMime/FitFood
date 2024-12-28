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
    
//    public typealias CreateResult = (String?, Error?)
//    public typealias FetchListResult = ([RecipeCategory]?, Error?)

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
    }

    
//    public func addSingleData(id : String, data: [String: Any]) async -> CreateResult {
//        do {
//           // let data = category.toDictionary()
//            _ = try await collectionRef.document(id).setData(data)
//            return (id, nil)
//        } catch {
//            // print("in catch")
//            return (nil, error)
//        }
//    }
//
//    public func fetchDataList() async -> FetchListResult {
//        do {
//            let snapshot = try await collectionRef.getDocuments()
//            let codableList: [RecipeCategoryCodable] = try snapshot.decoded()
//            let categoryList: [RecipeCategory] = codableList.map { $0.toRecipeCategory() }
//
//            print("datas count \(codableList.count)")
//
//            for data in categoryList {
//                print("data", data)
//            }
//
//            return (categoryList, nil)
//        } catch {
//            print("e \(error.localizedDescription)")
//            return (nil, error)
//        }
//    }
}


