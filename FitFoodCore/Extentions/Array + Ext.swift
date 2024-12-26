//
//  Array + Ext.swift
//  FitFoodCore
//
//  Created by Habibur Rahman on 25/12/24.
//

import Foundation

extension Array where Element == [String: Any] {
    public func toModel<T: Decodable>() -> Result<[T], Error> {
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: self, options: [])
            let models = try JSONDecoder().decode([T].self, from: jsonData)
            return .success(models)
        } catch {
            return .failure(error)
        }
    }
}
