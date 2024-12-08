//
//  FirebaseQuery+Extention.swift
//  FirebaseHelper
//
//  Created by Habibur Rahman on 8/12/24.
//

import Firebase

extension QueryDocumentSnapshot {
    func decoded<Type: Decodable>() throws -> Type {
        let jsonData = try JSONSerialization.data(withJSONObject: data(), options: [])
        let object = try JSONDecoder().decode(Type.self, from: jsonData)
        return object
    }
}

extension QuerySnapshot {
    func decoded<Type: Decodable>() throws -> [Type] {
        let objects: [Type] = try documents.map({ try $0.decoded() })
        return objects
    }
}
