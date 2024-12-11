//
//  AuthTest.swift
//  FirebaseHelperTests
//
//  Created by Habibur Rahman on 10/12/24.
//

import XCTest
import FirebaseAuth
import FirebaseCore

class FirebaseAuthManager {
    
    public typealias Result = Swift.Result<String,Error>
    
    let root : String

    public init(root: String) {
        self.root = root
    }

    
    public func signupWith(email: String, password: String) async -> Result {
        
        do {
            try Auth.auth().signOut()
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            return .success(result.user.uid)
        }catch{
            print("signup error \(error.localizedDescription)")
            return .failure(error)
        }
    }
    
    public func signinWith(email: String, password: String) async -> Result {
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            return .success(result.user.uid)
        }catch{
            return .failure(error)
           // print("U>> Failed to Login E -- \(error.localizedDescription)")
        }
    }

}

final class AuthTest: XCTestCase {
    
    func test_signin_newUserCreateSuccessfully() {
        
        let manager = makeSUT()
        let exp = expectation(description: "Create recipe")

        Task {
            let result = await manager.signupWith(email: dummyEmail, password: dummyPassword1)
            exp.fulfill()
            switch (result){
             
            case let .success(id):
                print("created user \(id)")
                XCTAssertNotNil(id)
                break
            case .failure(_):
                XCTFail("id is null")
            }
            
            
//            let id = try result.get()
//            print("created user \(id)")
//            exp.fulfill()
//            XCTAssertNotNil(id)
            
        }
        
        wait(for: [exp], timeout: 10)
        
    }
    
    func test_login_SuccessWithRightData() {
        //let data = dummyRecipe1
        let manager = makeSUT()
        let exp = expectation(description: "Wait for login")

        Task {
            let result = await manager.signinWith(email: dummyEmail, password: dummyPassword1)
            let id = try result.get()
            print("created user \(id)")
            XCTAssertNotNil(id)
            exp.fulfill()
           
        }
        wait(for: [exp], timeout: 10)
    }
    
    //Helpers :
    func makeSUT() -> FirebaseAuthManager{
        FirebaseApp.configure()
       
        let createRecipeManager = FirebaseAuthManager(root: "Test")
        
        return createRecipeManager
    }
    
    var dummyEmail = "email2@gmail.com"
    var dummyPassword1 = "password1"

}
