//
//  HomeViewModel.swift
//  ChallengeDevoteam
//
//  Created by Julio Cesar on 19/03/24.
//

import Foundation
import Combine

protocol HomeViewModelProtocol: ObservableObject {
    var products: [ProductModel] { get }
    init(_ networkManager: ProductsFetcherProtocol)
    func fetchProduct()
}

class HomeViewModel: HomeViewModelProtocol {
    @Published var products: [ProductModel] = []
    
    private let provider: ProductsFetcherProtocol
    private var subscribers = Set<AnyCancellable>()

    required init(_ provider: ProductsFetcherProtocol = ProductsProvider()) {
        self.provider = provider
    }

    func fetchProduct() {
        #if DEBUG
            products = productsMock.compactMap { self.parseToModel(from: $0) }
        #else
        provider
            .fetchProductList()
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    break
                case .failure:
                    self.products = [] //TODO: Should show empy screen, possibility to refresh
                }
            }, receiveValue: { result in

                self.products = result.products.compactMap { self.parseToModel(from: $0) }
            })
            .store(in: &subscribers)
        #endif
    }

    func parseToModel(from data: ProductData) -> ProductModel? {
        guard let title = data.title,
              let imageString = data.thumbnail,
              let url = URL(string: imageString),
              let rating = data.rating,
              let discount = data.discountPercentage,
              let stock = data.stock,
              let price = data.price,
              let details = data.description else { return nil }
        return ProductModel(title: title,
                            imageURL: url,
                            rating: rating.twoDigitString(),
                            discount: "\(Int(discount))%",
                            stock: String(stock),
                            price: Double(price).twoDigitString(),
                            details: details)
    }
}

private let productsMock = [
    ProductData(title: "perfume Oil",
                rating: 4.26,
                thumbnail: "https://cdn.dummyjson.com/product-images/11/thumbnail.jpg",
                 discountPercentage: 8,
                 stock: 15,
                price: 25, 
                description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."),
    ProductData(title: "Brown Perfume",
                rating: 4,
                thumbnail: "https://cdn.dummyjson.com/product-images/12/thumbnail.jpg",
                discountPercentage: 18,
                 stock: 115,
                price: 225, description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."),
    ProductData(title: "Brown Perfume",
                rating: 3.11,
                thumbnail: "https://cdn.dummyjson.com/product-images/13/thumbnail.webp",
                discountPercentage: 130,
                 stock: 1152,
                price: 2225, description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.")
]
