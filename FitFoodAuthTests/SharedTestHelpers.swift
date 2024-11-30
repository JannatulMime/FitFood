//
//  SharedTestHelpers.swift
//  FitFoodAuthTests
//
//  Created by Habibur Rahman on 30/11/24.
//

import Foundation

public func anyNSError() -> NSError {
    return NSError(domain: "any error", code: 1)
}

public func anyData() -> Data {
    return Data("any data".utf8)
}
