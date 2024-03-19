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
    let rating: Float
}


/*
 query

 https://dummyjson.com/products?limit=10&skip=10&select=title,rating,thumbnail,images,discountPercentage,stock,price

 https://dummyjson.com/products?limit=10&skip=10&select=title,rating,thumbnail
 */
