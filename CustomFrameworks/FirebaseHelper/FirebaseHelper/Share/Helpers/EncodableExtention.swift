//
//  EncodableExtention.swift
//  FirebaseHelper
//
//  Created by Habibur Rahman on 8/12/24.
//

import Foundation

extension Encodable {
    public func toDictionary() -> [String: Any]? {
        do {
            let data = try JSONEncoder().encode(self)
            let dictionary = try JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed) as? [String: Any]
            return dictionary
        } catch {
            print("Error converting to dictionary: \(error.localizedDescription)")
            return nil
        }
    }
}
