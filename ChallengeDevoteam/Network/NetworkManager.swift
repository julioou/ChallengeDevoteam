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

        if let cachedData = URLCache.shared.cachedResponse(for: URLRequest(url: url))?.data {
            return Just(cachedData)
                .decode(type: T.self, decoder: JSONDecoder())
                .mapError { _ in APIError.invalidData }
                .eraseToAnyPublisher()
        }


        return session.dataTaskPublisher(for: url)
            .tryMap { result -> Data in
                guard let response = result.response as? HTTPURLResponse,
                      (200...299).contains(response.statusCode),
                      response.statusCode == 200 else {
                    throw APIError.invalidResponse
                }

                let cachedResponse = CachedURLResponse(response: response, data: result.data)
                URLCache.shared.storeCachedResponse(cachedResponse, for: URLRequest(url: url))

                return result.data
            }
            .decode(type: T.self, decoder: JSONDecoder())
            .mapError { error in
                (error as? APIError) ?? .unexpected
            }
            .eraseToAnyPublisher()
    }
}
