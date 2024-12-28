//
//  RecipeCategoryTest.swift
//  FirebaseHelperTests
//
//  Created by Habibur Rahman on 10/12/24.
//

import XCTest

import Firebase
import Foundation
import FitFoodCore

@testable import FirebaseHelper

final class RecipeCategoryTest: XCTestCase {

    func test_createSingleCategory() {
        let data = dummyCat//catBreakfast.toDictionary()
        print("Data is - \(data)")
        let manager = makeSUT()
        let exp = expectation(description: "Create Category")

        Task {
            let result = await manager.addData(rootNode: catBreakfast.id, data: data)
            exp.fulfill()
            switch result {
            case let .success (id):
                XCTAssertNotNil(id)
                break
            case let .failure(error):
                XCTAssertNil(error)
                break
            }
        }
        wait(for: [exp], timeout: 10)
    }
    
    func test_fetch_success() {
        let data = dummyCat
        let manager = makeSUT()
        let exp = expectation(description: "Fetch cat")

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
    
    //Helpers :
    func makeSUT() -> FirebaseRecipeCategoryManager {
        FirebaseApp.configure()
       
        let manager = FirebaseRecipeCategoryManager(root: "Test")
        
        return manager
    }
    
    var dummyCat : [String: Any] {
        ["title":"test cat 01","imageUrl":"", "id": "1"]
    }

}



