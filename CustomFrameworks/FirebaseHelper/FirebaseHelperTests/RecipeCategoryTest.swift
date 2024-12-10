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

import FirebaseHelper

final class RecipeCategoryTest: XCTestCase {

    func test_createSingleCategory() {
        let data = catBreakfast
        let manager = makeSUT()
        let exp = expectation(description: "Create Category")

        Task {
            let (id,_) = await manager.addSingleData(category: data)
            exp.fulfill()
            XCTAssertNotNil(id)
        }
        wait(for: [exp], timeout: 10)
    }
    
    //Helpers :
    func makeSUT() -> FirebaseRecipeCategoryManager{
        FirebaseApp.configure()
       
        let manager = FirebaseRecipeCategoryManager(root: "Test")
        
        return manager
    }

}
