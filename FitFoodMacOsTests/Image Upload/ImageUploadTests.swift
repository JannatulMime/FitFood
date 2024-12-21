//
//  ImageUploadTests.swift
//  FitFoodMacOsTests
//
//  Created by Habibur Rahman on 20/12/24.
//

import XCTest
import FitBookMacOs

final class ImageUploadTests: XCTestCase {

    func test_uploadImage() throws {
        var image = UIImage.make(withColor: .green)
        let imageData = image.pngData()!

        let exp = expectation(description: "wait for image upload")

        let uploadManager = ImageKitImageUploader()

        Task {
            let result = await uploadManager.upload(fileName: "test2.png", data: imageData)
            switch result {
            case let .success(obj):
                XCTAssertNotNil(obj)
                break

            case let .failure(error):
                XCTFail(error.localizedDescription)
            }
            exp.fulfill()
        }

        wait(for: [exp], timeout: 10)
    }
}

extension UIImage {
    static func make(withColor color: UIColor) -> UIImage {
        let rect = CGRect(x: 0, y: 0, width: 1, height: 1)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()!
        context.setFillColor(color.cgColor)
        context.fill(rect)
        let img = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return img!
    }
}
