//
//  CreateRecipeTest.swift
//  FirebaseHelperTests
//
//  Created by Habibur Rahman on 7/12/24.
//

import Firebase
import FirebaseHelper
import FitFoodCore
import Foundation
import XCTest

// public protocol FirebaseCreateDataClient{
//    typealias Result = (String?, Error?)
//    func addDataInFBSCollection(collectionRef: CollectionReference,
//                                data: [String: Any]) async -> Result
//
// }

class CreateRecipeTest: XCTestCase {
    func test_create_CreateSuccess() {
        let data = getDummyData1()
        let manager = makeSUT()
        let exp = expectation(description: "Create recipe")

        Task {
            let result = await manager.addData(rootNode: "T1", data: data)
            exp.fulfill()
            switch result{
                case let .success(id):
                XCTAssertEqual(id, "T1")
            case let .failure(error):
                XCTFail("Expect suceess but receive failed \(error)")
            }
          
        }
        wait(for: [exp], timeout: 10)
    }

    func test_fetch_success() {
        let data = dummyRecipe1
        let manager = makeSUT()
        let exp = expectation(description: "Fetch recipe")

        Task {
            let result = await manager.fetchDataList()
           // print("Result is \(result)")

            
            switch result {
            case let .success(data):
                XCTAssertNotNil(data)
                break

            case let .failure(error):
                break
            }
            
            exp.fulfill()
           
        }
        wait(for: [exp], timeout: 10)
    }

    // Helpers :
    func makeSUT() -> FirebaseRecipeManager {
        FirebaseApp.configure()

        let createRecipeManager = FirebaseRecipeManager(root: "Test")

        return createRecipeManager
    }


    func getDummyData1() -> [String: Any] {
        return [
            "id": "T1",
            "name": "Egg Pudding",
            "rating": 4.5,
            "instructions": "Firstly put some eggs and mixed with sugar. Then add milk and mix well. Trun on the stove and cook until the pudding is thick. Then add some chocolate chips and mix well. Around 30 mins cook the pudding is ready. Then cool down of it. Serve it into chilled and enjoy..",
            "calories" : "250 Cal",
            "category" : "",
            "image" : "",
            "time": "30min",
            "ingredients": [
                "ing 1",
                "ing 2",
            ],
            "tags": [
                [
                    "id": "1",
                    "title": "Desert",
                ],
                [
                    "id": "1",
                    "title": "Milk",
                ],
            ],
        ]
    }
}




// func getDummyData2() -> [String: Any] {
//    return [
//        "name": "name 2",
//        "description": "Test1 des 2",
//        "ingredients": [
//            "ing 1",
//            "ing 2",
//        ],
//    ]
// }
