//
//  ContentView.swift
//  ChallengeDevoteam
//
//  Created by Julio Cesar on 19/03/24.
//

import SwiftUI

struct Home<ViewModel: HomeViewModelProtocol>: View {

    @StateObject var viewModel: ViewModel

    init (viewModel: ViewModel = HomeViewModel()) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        NavigationView {
            ScrollView {
                Text("Product List")
                    .font(.largeTitle)
                    .bold()
                    .frame(maxWidth: .infinity, 
                           alignment: .leading)
                    .padding()

                Divider()

                ForEach(viewModel.products) { item in
                    let viewModel = DetailViewModel(product: item)

                    NavigationLink(destination: DetailView(viewModel: viewModel)) {
                        ProductCardView(title: item.title,
                                        imageUrl: item.imageURL,
                                        rating: item.rating)
                        .padding(.horizontal, 20)
                        .padding(.bottom, 8)
                    }
                }
            }
            .padding(.top, 60)
            .background(Color(.systemGray6)).edgesIgnoringSafeArea(.all)
        }
        .onAppear {
            viewModel.fetchProduct()
        }
    }
}

#Preview {
    Home()
}
