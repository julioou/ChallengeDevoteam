//
//  ProductsProvider.swift
//  ChallengeDevoteam
//
//  Created by Julio Cesar on 20/03/24.
//

import Foundation
import Combine

protocol ProductsFetcherProtocol {
    func fetchProductList() -> AnyPublisher<ProductListData, APIError>
}

class ProductsProvider: ProductsFetcherProtocol {

    enum Endpoint {
        static let products = "https://dummyjson.com/products?limit=10&skip=10&select=title,rating,thumbnail,discountPercentage,stock,price"
    }

    private let service: APIClient

    init(service: APIClient = NetworkManager()) {
        self.service = service
    }

    func fetchProductList() -> AnyPublisher<ProductListData, APIError> {
        guard let url = URL(string: Endpoint.products) else {
            return Fail(error: APIError.invalidUrl).eraseToAnyPublisher()
        }
        return service.fetchData(ProductListData.self, from: url)
    }
}
