//
//  FirebaseDataHelper.swift
//  FirebaseHelper
//
//  Created by Habibur Rahman on 6/12/24.
//

import FirebaseCore
import FirebaseFirestore
import Foundation



class FirebaseHelper {
    struct Recipe: Codable {
        let id: String?
        let ingredients: String?
    }

    struct RecipeListResponse: Codable {
        let list: [Recipe]
    }
}

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

public class FirebaseDataHelper {
    var datas = [FirebaseHelper.Recipe]()
    public init() {
        FirebaseApp.configure()
        Firestore.firestore().collection("Recipes").getDocuments { snapshot, _ in
            do{
                self.datas = try snapshot?.decoded() ?? []
                print("datas count \(self.datas.count)")
                
                for data in self.datas{
                    print("data", data)
                }
            }catch{
                
            }
        }
    }

//    func fetchAllRecipe() {
//       
//
//        Firestore.firestore().collection("Recipes").getDocuments { snapshot, _ in
//            snapshot?.documents.forEach({ document in
//                let dictionary = document.data()
//                print("data", dictionary)
//                let decoder = JSONDecoder()
//
//            })
//        }
//    }

}
