//
//  APIClientSpy.swift
//  ChallengeDevoteamTests
//
//  Created by Julio Cesar on 20/03/24.
//

import Foundation
import Combine
@testable import ChallengeDevoteam

class APIClientSpy: APIClient {
    var shouldFail = false
    var url: URL?

    func fetchData<T>(_ type: T.Type, from endpoint: URL) -> AnyPublisher<T, ChallengeDevoteam.APIError> where T : Decodable {
        self.url = endpoint
        if shouldFail {
            return Fail(error: APIError.invalidResponse)
                .eraseToAnyPublisher()
        } else {
            let data = "dummy data".data(using: .utf8)!
            return Just(data)
                .decode(type: T.self, decoder: JSONDecoder())
                .mapError { _ in APIError.invalidData }
                .eraseToAnyPublisher()
        }
    }
}
