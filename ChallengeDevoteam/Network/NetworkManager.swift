//
//  APIClient.swift
//  ChallengeDevoteam
//
//  Created by Julio Cesar on 20/03/24.
//

import Foundation
import Combine

protocol APIClient {
    func fetchData<T: Decodable>(_ type: T.Type, from endpoint: URL) -> AnyPublisher<T, APIError>
}

class NetworkManager: APIClient {

    private let session: URLSession

    init(session: URLSession = URLSession.shared) {
        self.session = session
    }

    func fetchData<T: Decodable>(_ type: T.Type, from url: URL) -> AnyPublisher<T, APIError> {

        session.dataTaskPublisher(for: url)
            .tryMap { element -> Data in
                        guard let response = element.response as? HTTPURLResponse,
                                (200...299).contains(response.statusCode) else {
                            throw APIError.invalidResponse
                        }
                        return element.data
                    }
            .decode(type: T.self, decoder: JSONDecoder())
            .mapError { error in
                (error as? APIError) ?? .unexpected
            }
            .eraseToAnyPublisher()
    }
}
