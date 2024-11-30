//
//  FitFoodAuthTests.swift
//  FitFoodAuthTests
//
//  Created by Habibur Rahman on 30/11/24.
//

import XCTest

public struct User: Equatable {
    let email: String
    let id: String
}

public protocol AuthClient {
    typealias Result = Swift.Result<User, Error>
    func createAccount(completion: @escaping (Result) -> Void)
}

public class AuthManager {
    let client: AuthClient

    init(client: AuthClient) {
        self.client = client
    }

    func createAccount( completion: @escaping (AuthClient.Result) -> Void) {
        client.createAccount() { result in
            switch result {
            case let .success(user):
                completion(.success(user))
            case let .failure(error):
                completion(.failure(error))
            }
        }
    }
}

//public class FirebaseAuthManager : AuthClient {
//    let client: AuthClient
//
//    init(email: String, password: String) {
//        self.client = client
//    }
//
//    func createAccount(email: String, password: String, completion: @escaping (AuthClient.Result) -> Void) {
//        client.createAccount(email: email, password: password) { result in
//            switch result {
//            case let .success(user):
//                completion(.success(user))
//            case let .failure(error):
//                completion(.failure(error))
//            }
//        }
//    }
//}

public class AuthManagerSpy: AuthClient {
    var messages = [(AuthClient.Result) -> Void]()

    public func createAccount(completion: @escaping (AuthClient.Result) -> Void) {
        messages.append(completion)
    }

    func completeWithSuccess(user: User, at index: Int = 0) {
        messages[index](.success(user))
    }

    func completeWithError(error: Error, at index: Int = 0) {
        messages[index](.failure(error))
    }
}

final class FitFoodAuthTests: XCTestCase {
    func test_createAccount_NotCalledInitially() {
        let (_,client) = makeSUT()

        XCTAssertEqual(client.messages.count, 0)
    }

    func test_createAccount_SuccessWithEmailAndPassword() {
        let (sut, client) = makeSUT()
        expect(sut: sut, toCompleteWith: .success(anyUser())) {
            client.completeWithSuccess(user: anyUser())
        }
    }

    func test_createAccount_SentErrorInAccountCreationFail() {
        let (sut, client) = makeSUT()
        expect(sut: sut, toCompleteWith: .failure(anyNSError())) {
            client.completeWithError(error: anyNSError())
        }
    }

    // MARK: - Helpers

    func makeSUT() -> (sut: AuthManager, client: AuthManagerSpy) {
        let client = AuthManagerSpy()
        let sut = AuthManager(client: client)

        return (sut: sut, client: client)
    }
    
    func expect(
        sut : AuthManager,
        toCompleteWith expectedResult : AuthClient.Result,
        when action: () -> Void ,
        file: StaticString = #file,
        line: UInt = #line){
        
        let exp = expectation(description: "Wait for Account Creation")
        
        sut.createAccount( completion: { receivedResult in
            
            switch(receivedResult,expectedResult){
            case let (.success(receivedUser), .success(expectedUser)):
                XCTAssertEqual(receivedUser, expectedUser, file: file, line: line)
                break
                
            case let (.failure(receivedError),.failure(expectedError)):
                XCTAssertEqual(receivedError as NSError, expectedError as NSError, file: file, line: line)
                break
                
            default:
                XCTFail("Expected result: \(receivedResult) got \(receivedResult)", file: file, line: line)
            }
       
            exp.fulfill()
        })
        
        action()
        
        wait(for: [exp], timeout: 1.0)
    }

    func anyUser() -> User {
        User(email: "email1@gmail.com", id: "10")
    }
}
