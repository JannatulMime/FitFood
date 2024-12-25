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
            let (id,_) = await manager.addSingleData(id: catBreakfast.id,data: data)
            exp.fulfill()
            XCTAssertNotNil(id)
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



