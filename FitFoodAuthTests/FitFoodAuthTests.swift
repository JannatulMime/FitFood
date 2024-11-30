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
    func createAccount(email: String, password: String, completion: @escaping (Result) -> Void)
}

public class FirebaseAuthManager {
    let client: AuthClient

    init(client: AuthClient) {
        self.client = client
    }

    func createAccount(email: String, password: String, completion: @escaping (AuthClient.Result) -> Void) {
        client.createAccount(email: email, password: password) { result in
            switch result {
            case let .success(user):
                completion(.success(user))
            case let .failure(error):
                completion(.failure(error))
            }
        }
    }
}

public class AuthClientSpy: AuthClient {
    var messages = [(email: String, completion: (AuthClient.Result) -> Void)]()

    public func createAccount(email: String, password: String, completion: @escaping (AuthClient.Result) -> Void) {
        messages.append((email, completion))
    }

    func completeWithSuccess(user: User, at index: Int = 0) {
        messages[index].completion(.success(user))
    }

    func completeWithError(error: Error, at index: Int = 0) {
        messages[index].completion(.failure(error))
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

    func makeSUT() -> (sut: FirebaseAuthManager, client: AuthClientSpy) {
        let client = AuthClientSpy()
        let sut = FirebaseAuthManager(client: client)

        return (sut: sut, client: client)
    }
    
    func expect(
        sut : FirebaseAuthManager,
        toCompleteWith expectedResult : AuthClient.Result,
        when action: () -> Void ,
        file: StaticString = #file,
        line: UInt = #line){
        
        let exp = expectation(description: "Wait for Account Creation")
        
        sut.createAccount(email: "", password: "123456", completion: { receivedResult in
            
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
