//
//  RecipeImageUploaderTests.swift
//  FirebaseHelperTests
//
//  Created by Habibur Rahman on 16/12/24.
//

import XCTest
@testable import FirebaseHelper
import FirebaseCore

final class RecipeImageUploaderTests: XCTestCase {

    func test_testImageUpload() {
        FirebaseApp.configure()
        let imageUploader = RecipeImageUploader(root: "Test")
        let exp = expectation(description: "Upload Image")
        Task{
            let uploadResult = try await imageUploader.uploadImage(data: Data(), fileName: "image1.jpg")
            
            switch uploadResult {
            case let .success (id):
                XCTAssertNotNil(id)
                break
            case let .failure(error):
                XCTAssertNil(error)
                break
            }
            exp.fulfill()
        }
        
        
        wait(for: [exp], timeout: 10)
        
    }

}
