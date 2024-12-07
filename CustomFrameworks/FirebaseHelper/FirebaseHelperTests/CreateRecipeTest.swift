//
//  CreateRecipeTest.swift
//  FirebaseHelperTests
//
//  Created by Habibur Rahman on 7/12/24.
//

import Firebase
import FirebaseFirestore
import Foundation
import XCTest
import FitFoodCore

//public protocol FirebaseCreateDataClient{
//    typealias Result = (String?, Error?)
//    func addDataInFBSCollection(collectionRef: CollectionReference,
//                                data: [String: Any]) async -> Result
//    
//}

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
}

extension RecipeCodable {
    func toRecipe() -> Recipe {
       // let recipeCategory : Category = Category(rawValue: category)
      
        Recipe(id: id, name: name, ingredients: ingredients, instructions: instructions, image: image, category: .breakfast, rating: rating, time: time, calories: calories, tags: tags.map{$0.toTag()})
    }
}

public struct TagCodable : Codable {
    public let id : String
    public let title : String
    
    public func toTag() -> RecipeTag {
        return RecipeTag(id: id, title: title)
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

extension Encodable {
    func toDictionary() -> [String: Any]? {
        do {
            let data = try JSONEncoder().encode(self)
            let dictionary = try JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed) as? [String: Any]
            return dictionary
        } catch {
            print("Error converting to dictionary: \(error.localizedDescription)")
            return nil
        }
    }
}

extension RecipeTag{
    func toTagCodable() -> TagCodable{
        TagCodable(id: id, title: title)
    }
}


class FirebaseRecipeManager {
    
    typealias Result = (String?, Error?)
   
    let firestore = Firestore.firestore()
    let collectionRef: CollectionReference
    
    init (root: String) {
        collectionRef = firestore.collection(root).document("Recipes").collection("list")
    }
    
    func addData(recipe: Recipe) async -> Result {
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
    
    
    func fetchDataList() {
        var datas = [RecipeCodable]()
        collectionRef.getDocuments { snapshot, _ in
            do{
                datas = try snapshot?.decoded() ?? []
                print("datas count \(datas.count)")
                
                for data in datas{
                    print("data", data)
                }
            }catch{
                
            }
        }
    }
}

extension QueryDocumentSnapshot {
    func decoded<Type: Decodable>() throws -> Type {
        let jsonData = try JSONSerialization.data(withJSONObject: data(), options: [])
        let object = try JSONDecoder().decode(Type.self, from: jsonData)
        return object
    }
}

extension QuerySnapshot {
    func decoded<Type: Decodable>() throws -> [Type] {
        let objects: [Type] = try documents.map({ try $0.decoded() })
        return objects
    }
    
}



class CreateRecipeTest: XCTestCase {
  
    func test_create_CreateSuccess() {
        let data = dummyRecipe1
        let manager = makeSUT()
        let exp = expectation(description: "Create recipe")

        Task {
            let (id,_) = await manager.addData(recipe: data)
            exp.fulfill()
            XCTAssertNotNil(id)
        }
        wait(for: [exp], timeout: 10)
    }
    
    //Helpers :
    func makeSUT() -> FirebaseRecipeManager{
        FirebaseApp.configure()
       
        let createRecipeManager = FirebaseRecipeManager(root: "Test")
        
        return createRecipeManager
    }

    func getDummyData1() -> [String: Any] {
        return [
            "name": "name 1",
            "description": "Test1 des",
            "ingredients": [
                "ing 1",
                "ing 2",
            ],
        ]
    }

    func getDummyData2() -> [String: Any] {
        return [
            "name": "name 2",
            "description": "Test1 des 2",
            "ingredients": [
                "ing 1",
                "ing 2",
            ],
        ]
    }
}
