//
//  ProductData.swift
//  ChallengeDevoteamTests
//
//  Created by Julio Cesar on 20/03/24.
//

import Foundation
@testable import ChallengeDevoteam

extension ProductData {

    static func mock() -> Self {
        ProductData(title: "perfume Oil",
                    rating: 4.26,
                    thumbnail: "https://cdn.dummyjson.com/product-images/11/thumbnail.jpg",
                    discountPercentage: 8,
                    stock: 15,
                    price: 25,
                    description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.")
    }
}
