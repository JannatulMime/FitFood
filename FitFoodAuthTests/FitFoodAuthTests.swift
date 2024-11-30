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
        let sut = AuthClientSpy()

        XCTAssertEqual(sut.messages.count, 0)
    }

    func test_createAccount_SuccessWithEmailAndPassword() {
        let (sut, client) = makeSUT()
        let sentUser = anyUser()
        var receivedUser: User?
        let exp = expectation(description: "Wait for Account Creation")

        sut.createAccount(email: sentUser.email, password: "123456", completion: { result in
            switch result {
            case let .success(user):
                receivedUser = user
            default:
                break
            }
            exp.fulfill()
        })

        client.completeWithSuccess(user: sentUser)
        XCTAssertEqual(receivedUser, sentUser)
        wait(for: [exp], timeout: 1.0)
    }

    func test_createAccount_SentErrorInAccountCreationFail() {
        let (sut, client) = makeSUT()
        var receivedError: NSError?
        let exp = expectation(description: "Wait for Account Creation")

        sut.createAccount(email: "", password: "123456", completion: { result in
            switch result {
            case let .failure(error):
                receivedError = error as NSError
            default:
                break
            }
            exp.fulfill()
        })

        client.completeWithError(error: anyNSError())
        XCTAssertEqual(receivedError?.code, anyNSError().code)
        wait(for: [exp], timeout: 1.0)
    }

    // MARK: - Helpers

    func makeSUT() -> (sut: FirebaseAuthManager, client: AuthClientSpy) {
        let client = AuthClientSpy()
        let sut = FirebaseAuthManager(client: client)

        return (sut: sut, client: client)
    }

    func anyUser() -> User {
        User(email: "email1@gmail.com", id: "10")
    }
}
