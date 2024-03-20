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
//        provider
//            .fetchProductList()
//            .receive(on: DispatchQueue.main)
//            .sink(receiveCompletion: { completion in
//                switch completion {
//                case .finished:
//                    break
//                case .failure:
//                    self.products = [] //TODO: Should show empy screen, possibility to refresh
//                }
//            }, receiveValue: { result in
//
//                self.products = result.products.compactMap { self.parseToModel(from: $0) }
//            })
//            .store(in: &subscribers)

        products = productsMock.compactMap { self.parseToModel(from: $0) }
    }

    func parseToModel(from data: ProductData) -> ProductModel? {
        guard let title = data.title,
              let imageString = data.thumbnail,
              let url = URL(string: imageString),
              let rating = data.rating,
              let discount = data.discountPercentage,
              let stock = data.stock,
              let price = data.price else { return nil }
        return ProductModel(title: title,
                     imageURL: url,
                     rating: rating.twoDigitString(),
                     discount: String(discount),
                     stock: String(stock),
                     price: String(price))
    }
}

private let productsMock = [
    ProductData(title: "perfume Oil",
                rating: 4.26,
                thumbnail: "https://cdn.dummyjson.com/product-images/11/thumbnail.jpg",
                 discountPercentage: 8,
                 stock: 15,
                 price: 25),
    ProductData(title: "Brown Perfume",
                rating: 4,
                thumbnail: "https://cdn.dummyjson.com/product-images/12/thumbnail.jpg",
                discountPercentage: 18,
                 stock: 115,
                 price: 225),
    ProductData(title: "Brown Perfume",
                rating: 3.11,
                thumbnail: "https://cdn.dummyjson.com/product-images/13/thumbnail.webp",
                discountPercentage: 130,
                 stock: 1152,
                 price: 2225)
]
