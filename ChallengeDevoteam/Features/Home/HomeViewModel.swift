//
//  HomeViewModel.swift
//  ChallengeDevoteam
//
//  Created by Julio Cesar on 19/03/24.
//

import Foundation
import Combine

class HomeViewModel: ObservableObject {
    @Published var products: [ProductModel] = []
}

// mock request

extension HomeViewModel {

    func requestProducts() {
//        products = [ProductModel(title: "perfume Oil",
//                                 imageURL: URL(string: "https://cdn.dummyjson.com/product-images/11/thumbnail.jpg")!,
//                                 rating: "4.26"),
//                    ProductModel(title: "Brown Perfume",
//                                             imageURL: URL(string: "https://cdn.dummyjson.com/product-images/12/thumbnail.jpg")!,
//                                             rating: 4),
//                    ProductModel(title: "Fog Scent Xpressio Perfume",
//                                             imageURL: URL(string: "https://cdn.dummyjson.com/product-images/13/thumbnail.webp")!,
//                                             rating: 4.59)
//        ]

        products = [
            ProductModel(title: "perfume Oil",
                         imageURL: URL(string: "https://cdn.dummyjson.com/product-images/11/thumbnail.jpg")!,
                         rating: "4.26",
                         discount: "8%",
                         stock: "15",
                         price: "25€"),
            ProductModel(title: "Brown Perfume",
                         imageURL: URL(string: "https://cdn.dummyjson.com/product-images/12/thumbnail.jpg")!,
                         rating: "4",
                         discount: "18%",
                         stock: "115",
                         price: "225€"),
            ProductModel(title: "Brown Perfume",
                         imageURL: URL(string: "https://cdn.dummyjson.com/product-images/13/thumbnail.webp")!,
                         rating: "3.11",
                         discount: "130%",
                         stock: "1152",
                         price: "2225€")
        ]
    }
}


/*

 mock json

 {"products":[{"id":11,
 "title":"perfume Oil",
 "rating":4.26,
 "thumbnail":""},
 {"id":12,
 "title":"Brown Perfume",
 "rating":4,
 "thumbnail":"https://cdn.dummyjson.com/product-images/12/thumbnail.jpg"},
 {"id":13,
 "title":"Fog Scent Xpressio Perfume",
 "rating":4.59,
 "thumbnail":"https://cdn.dummyjson.com/product-images/13/thumbnail.webp"}],"total":100,"skip":10,"limit":3}

 */
