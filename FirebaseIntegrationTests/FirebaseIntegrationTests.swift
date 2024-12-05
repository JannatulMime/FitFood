//
//  FirebaseIntegrationTests.swift
//  FirebaseIntegrationTests
//
//  Created by Habibur Rahman on 3/12/24.
//

import XCTest
import FirebaseIntegration

final class FirebaseIntegrationTests: XCTestCase {

    func test_getData(){
        let sut = FetchRecipeDataManager()
        sut.getAllRecipeList()
        XCTAssertTrue(true)
    }

}
