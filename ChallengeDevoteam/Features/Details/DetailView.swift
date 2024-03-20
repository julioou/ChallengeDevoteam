//
//  DetailView.swift
//  ChallengeDevoteam
//
//  Created by Julio Cesar on 19/03/24.
//

import SwiftUI
import SDWebImageSwiftUI

struct DetailView: View {

    var viewModel: DetailViewModel
    
    init(viewModel: DetailViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        VStack(alignment: .leading) {

            HStack {
                Text(viewModel.product.title)
                    .font(.largeTitle)
                    .foregroundColor(.black)
                    .lineLimit(2)
                    .bold()
                    .frame(maxWidth: .infinity, alignment: .center)
                    .minimumScaleFactor(0.4)
            }
            .padding(.top, 20)

            ScrollView {
                HStack {
                    Spacer()

                    Image(systemName: "star.fill")
                        .resizable()
                        .scaledToFill()
                        .foregroundColor(.yellow)
                        .frame(width: 28, height: 28)


                    Text(viewModel.product.rating)
                        .font(.title3)
                        .foregroundColor(.black)
                        .bold()
                }

                WebImage(url: viewModel.product.imageURL)
                    .resizable()
                    .scaledToFill()
                    .frame(maxWidth: .infinity, maxHeight: 300)
                    .background(.black)
                    .cornerRadius(12)
                    .padding(.bottom, 16)

                Divider()

                HStack(alignment: .top) {
                    Text("€")
                        .font(.title)
                        .bold()
                        .foregroundColor(.red)
                    Text(viewModel.product.price)
                        .font(.largeTitle)
                        .bold()
                        .foregroundColor(.red)

                    Spacer()

                    Text("stock:")
                        .font(.title3)
                        .bold()
                        .foregroundColor(.gray)
                    Text(viewModel.product.stock)
                        .font(.title3)
                        .bold()
                        .foregroundColor(.black)
                }

                HStack(alignment: .bottom) {
                    Text(viewModel.product.discount)
                        .font(.title)
                        .bold()
                        .foregroundColor(.black)
                    Text("OFF")
                        .font(.title3)
                        .bold()
                        .foregroundColor(.gray)

                    Spacer()
                }

                    Divider()
                    .padding(.vertical)
                
                    Text(viewModel.product.details)
                        .font(.title3)
                        .bold()
                        .foregroundColor(.gray)
            }
        }
        .padding(.horizontal, 28)
    }
}

#Preview {
    DetailView(viewModel: DetailViewModel(
        product: ProductModel(title: "Non-Alcoholic Concentrated Perfume Oil",
                              imageURL: URL(string: "https://cdn.dummyjson.com/product-images/11/thumbnail.jpg")!,
                              rating: "4.26",
                              discount: "30%",
                              stock: "300",
                              price: "99,00",
                              details: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.")
    ))
}
