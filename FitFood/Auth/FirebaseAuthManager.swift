//
//  FirebaseAuthManager.swift
//  FitFood
//
//  Created by Habibur Rahman on 29/11/24.
//

//import Foundation
//import FirebaseAuth
//
//
//class FirebaseAuthManager {
//    
//    func createUser(withEmail email: String, password: String, fullName: String) async throws {
//        
//        do {
//            let result = try await Auth.auth().createUser(withEmail: email, password: password)
//          //  self.userSession = result.user
//           // try await self.uploaduserData(email: email, fullName: fullName, id: result.user.uid)
//           // loadCurrentUserData()
//           print("U>> Created User \(result.user.uid)")
//        }catch{
//            print("U>> Failed to create User -- \(error.localizedDescription)")
//        }
//    }
//    
//    func login(withEmail email: String, password: String) async throws {
//        do {
//            let result = try await Auth.auth().signIn(withEmail: email, password: password)
//           // self.userSession = result.user
//           // loadCurrentUserData()
//        }catch{
//            print("U>> Failed to Login E -- \(error.localizedDescription)")
//        }
//    }
//
//}
