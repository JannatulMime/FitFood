//
//  FirebaseClient.swift
//  FirebaseHelper
//
//  Created by Habibur Rahman on 28/12/24.
//

import Foundation

public protocol FirebaseClient {
   
    typealias CreateResult = Swift.Result<String,Error>
    typealias FetchListResult = Swift.Result<[[String: Any]],Error>
    
    func addData(rootNode : String , data : [String: Any]) async -> CreateResult
    func fetchList() async -> FetchListResult
}
