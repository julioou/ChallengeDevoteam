//
//  ProductModel.swift
//  ChallengeDevoteam
//
//  Created by Julio Cesar on 19/03/24.
//

import Foundation

struct ProductModel: Identifiable, Hashable {

    let id = UUID()
    let title: String
    let imageURL: URL
    let rating: String

    let discount: String
    let stock: String
    let price: String
}
