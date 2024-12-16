//
//  RecipeImageUploader.swift
//  FirebaseHelper
//
//  Created by Habibur Rahman on 16/12/24.
//

import Foundation
import FirebaseStorage

class RecipeImageUploader {
    
    public typealias uploadResult = Swift.Result<String,Error> //(String?, Error?)
    let root : String

    public init(root: String) {
        self.root = root
    }
    
    @MainActor
    func uploadImage(data: Data, fileName:String) async throws -> uploadResult {
    
        let filePath =  root + "/" + "Recipe" + "/" + fileName

        let ref = Storage.storage().reference(withPath: filePath)
        do{
            _ = try await ref.putDataAsync(data)
            let downloadUrl = try await ref.downloadURL()
            return .success(downloadUrl.absoluteString)
        }catch{
            return .failure(error)
        }
    }
}
