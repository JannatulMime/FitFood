//
//  ImageKitImageUploader.swift
//  FitBookMacOs
//
//  Created by Habibur Rahman on 21/12/24.
//

import Foundation
import FitFoodCore

public class ImageKitImageUploader {
    
    public typealias UploadResult = Swift.Result<ImageUploadResponseModel, Error>
    private let key = "cHJpdmF0ZV96M2k4M2NTcjhibUF5Yzl5dTEzUXpYV1JIczA9Og=="

    let apiManager = APIManager()

    public init(){ }
    
    public func upload(fileName: String, data: Data) async -> UploadResult {
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
    public struct ImageUploadResponseModel: Codable {
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
