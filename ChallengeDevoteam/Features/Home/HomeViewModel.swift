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
