//
//  APIManager.swift
//  FitFoodCore
//
//  Created by Habibur Rahman on 21/12/24.
//

import Foundation

public class APIManager {
   
    
    public init(){
        
    }
    
    public func callApi(request: URLRequest) async throws -> (Data, URLResponse) {
        let (data, response) = try await URLSession.shared.data(for: request)

        debugPrint("U>> url \(String(describing: request.url))  --- response")
        // debugPrint(data.prettyString ?? "")

        print(String(data: data, encoding: .utf8)!)
        return (data, response)
    }
}
