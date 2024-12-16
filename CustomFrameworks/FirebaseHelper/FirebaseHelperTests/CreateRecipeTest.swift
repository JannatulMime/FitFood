//
//  CreateRecipeTest.swift
//  FirebaseHelperTests
//
//  Created by Habibur Rahman on 7/12/24.
//

import Firebase
import Foundation
import XCTest
import FitFoodCore
import FirebaseHelper

//public protocol FirebaseCreateDataClient{
//    typealias Result = (String?, Error?)
//    func addDataInFBSCollection(collectionRef: CollectionReference,
//                                data: [String: Any]) async -> Result
//    
//}


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
    
    func test_fetch_CreateSuccess() {
        let data = dummyRecipe1
        let manager = makeSUT()
        let exp = expectation(description: "Fetch recipe")

        Task {
            let (recipeList,error) = await manager.fetchDataList()
            
//            for recipe in recipeList ?? [] {
//                print(recipe.instructions)
//            }
            
            exp.fulfill()
            XCTAssertNotNil(recipeList)
        }
        wait(for: [exp], timeout: 10)
    }
    
    //Helpers :
    func makeSUT() -> FirebaseRecipeManager{
        FirebaseApp.configure()
       
        let createRecipeManager = FirebaseRecipeManager(root: "Test")
        
        return createRecipeManager
    }

    
}

//func getDummyData1() -> [String: Any] {
//    return [
//        "name": "name 1",
//        "description": "Test1 des",
//        "ingredients": [
//            "ing 1",
//            "ing 2",
//        ],
//    ]
//}
//
//func getDummyData2() -> [String: Any] {
//    return [
//        "name": "name 2",
//        "description": "Test1 des 2",
//        "ingredients": [
//            "ing 1",
//            "ing 2",
//        ],
//    ]
//}
