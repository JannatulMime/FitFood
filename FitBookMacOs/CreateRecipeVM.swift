//
//  CreateRecipeVM.swift
//  FitBookMacOs
//
//  Created by Habibur Rahman on 3/12/24.
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

class CreateRecipeVM: ObservableObject {
    var datas = [FirebaseHelper.Recipe]()
    init() {
        FirebaseApp.configure()
//        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
//            self.fetchRestaurant()
//        }

        // self.fetchAllRecipe()

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

//    static func fetchAllRecipe(completion: @escaping([TFUser]) -> Void) {
    func fetchAllRecipe() {
        // var users = [TFUser]()

        Firestore.firestore().collection("Recipes").getDocuments { snapshot, _ in
            snapshot?.documents.forEach({ document in
                let dictionary = document.data()
                print("data", dictionary)
                let decoder = JSONDecoder()
                //  let data = /* fetch data from the network */

                // users.append(user)

//                    if users.count == snapshot?.documents.count {
//                        completion(users)
//                    }
            })
        }
    }

//    func fetchRestaurant() {
//        let db = Firestore.firestore()
//
//        let docRef = db.collection("Recipes").document("Recipe")
//
//        docRef.getDocument { (document, error) in
//            guard error == nil else {
//                print("error", error ?? "")
//                return
//            }
//
//            if let document = document, document.exists {
//                let data = document.data()
//                if let data = data {
//                    print("data", data)
//
//                    //self.restaurant = data["name"] as? String ?? ""
//                }
//            }
//
//        }
//    }
}
