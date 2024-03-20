//
//  DetailView.swift
//  ChallengeDevoteam
//
//  Created by Julio Cesar on 19/03/24.
//

import SwiftUI

struct DetailView: View {

    var viewModel: DetailViewModel

    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    DetailView(viewModel: DetailViewModel(
        product: ProductModel(title: "perfume Oil",
                              imageURL: URL(string: "https://cdn.dummyjson.com/product-images/11/thumbnail.jpg")!,
                              rating: "4.26",
                              discount: "30%",
                              stock: "300",
                              price: "99€")
    ))
}
