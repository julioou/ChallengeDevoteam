//
//  ProductsDTO.swift
//  ChallengeDevoteam
//
//  Created by Julio Cesar on 20/03/24.
//

import Foundation

struct ProductListData: Decodable {
    let products: [ProductData]
}

struct ProductData: Decodable {

    let title: String?
    let rating: Double?
    let thumbnail: String?
    let discountPercentage: Double?
    let stock: Int?
    let price: Int?
}
