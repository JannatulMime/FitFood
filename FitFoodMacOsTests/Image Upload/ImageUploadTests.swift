//
//  ImageUploadTests.swift
//  FitFoodMacOsTests
//
//  Created by Habibur Rahman on 20/12/24.
//

import XCTest

final class ResponseParser {
    func parseResponse<T: Codable>(from data: Data) throws -> T? {
        let decoder = JSONDecoder()

        do {
            return try decoder.decode(T.self, from: data)
        } catch let DecodingError.keyNotFound(key, context) {
            print("Decoding error (keyNotFound): \(key) not found in \(context.debugDescription)")
            print("Coding path: \(context.codingPath)")
        } catch let DecodingError.dataCorrupted(context) {
            print("Decoding error (dataCorrupted): data corrupted in \(context.debugDescription)")
            print("Coding path: \(context.codingPath)")
        } catch let DecodingError.typeMismatch(type, context) {
            print("Decoding error (typeMismatch): type mismatch of \(type) in \(context.debugDescription)")
            print("Coding path: \(context.codingPath)")
        } catch let DecodingError.valueNotFound(type, context) {
            print("Decoding error (valueNotFound): value not found for \(type) in \(context.debugDescription)")
            print("Coding path: \(context.codingPath)")
        }

        return nil
    }
}

class ImageKitImageUploader {
    public typealias UploadResult = Swift.Result<ImageUploadResponseModel, Error>
    private let key = "cHJpdmF0ZV96M2k4M2NTcjhibUF5Yzl5dTEzUXpYV1JIczA9Og=="

    let apiManager = APIManager()

    func upload(fileName: String, data: Data) async -> UploadResult {
        let boundary = "Boundary-\(UUID().uuidString)"
        let formData = generateFormData(fileName: fileName, data: data, boundary: boundary)
        let url = URL(string: "https://upload.imagekit.io/api/v1/files/upload")!
        let request = generateRequest(url: url, body: formData, boundary: boundary)

        let task: Task<UploadResult, Never> = Task {
            do {
                let (data, response) = try await apiManager.callApi(request: request)
                let resultObj: ImageUploadResponseModel? = try ResponseParser().parseResponse(from: data)
                return .success(resultObj!)
            } catch {
                return .failure(error)
            }
        }

        return await task.value
    }
}

extension ImageKitImageUploader {
    private func generateFormData(fileName: String, data: Data, boundary: String) -> Data {
        let parameters = [
            [
                "key": "file",
                "src": "path",
                "type": "file",
            ],
            [
                "key": "fileName",
                "value": fileName,
                "type": "text",
            ],
            [
                "key": "useUniqueFileName",
                "value": "false",
                "type": "text",
            ]] as [[String: String]]

        var body = Data()

        for param in parameters {
            if param["disabled"] != nil { continue }
            let paramName = param["key"]!
            body += Data("--\(boundary)\r\n".utf8)
            body += Data("Content-Disposition:form-data; name=\"\(paramName)\"".utf8)
            if param["contentType"] != nil {
                body += Data("\r\nContent-Type: \(String(describing: param["contentType"]))".utf8)
            }
            let paramType = param["type"]
            if paramType == "text" {
                let paramValue = param["value"]!
                body += Data("\r\n\r\n\(paramValue)\r\n".utf8)
            } else {
                let paramSrc = param["src"]!
                let fileURL = URL(fileURLWithPath: paramSrc)
                body += Data("; filename=\"\(paramSrc)\"\r\n".utf8)
                body += Data("Content-Type: \"content-type header\"\r\n".utf8)
                body += Data("\r\n".utf8)
                body += data
                body += Data("\r\n".utf8)
            }
        }
        body += Data("--\(boundary)--\r\n".utf8)

        return body
    }

    private func generateRequest(url: URL, body: Data?, boundary: String) -> URLRequest {
        var request = URLRequest(url: url, timeoutInterval: Double.infinity)
        request.addValue("Basic \(key)", forHTTPHeaderField: "Authorization")
        request.addValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")

        request.httpMethod = "POST"
        request.httpBody = body

        return request
    }
}

extension ImageKitImageUploader {
    struct ImageUploadResponseModel: Codable {
        let fileID, name: String
        let size: Int

        let filePath: String
        let url: String
        let fileType: String
        let height, width: Int
        let thumbnailURL: String

        enum CodingKeys: String, CodingKey {
            case fileID = "fileId"
            case name, size, filePath, url, fileType, height, width
            case thumbnailURL = "thumbnailUrl"
        }
    }
}


class APIManager {
    public func callApi(request: URLRequest) async throws -> (Data, URLResponse) {
        let (data, response) = try await URLSession.shared.data(for: request)

        debugPrint("U>> url \(String(describing: request.url))  --- response")
        // debugPrint(data.prettyString ?? "")

        print(String(data: data, encoding: .utf8)!)
        return (data, response)
    }
}

final class ImageUploadTests: XCTestCase {
    func test_base64Test() {
        let string = "private_rGAPQJbhBx:"
        let encoded = string.data(using: .utf8)?.base64EncodedString()
        print(encoded)
    }

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
