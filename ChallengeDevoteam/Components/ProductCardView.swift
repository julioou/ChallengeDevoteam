//
//  ProductCardView.swift
//  ChallengeDevoteam
//
//  Created by Julio Cesar on 19/03/24.
//

import SwiftUI
import SDWebImageSwiftUI

struct ProductCardView: View {

    let title: String
    let imageUrl: URL
    let rating: String

    var body: some View {
        VStack(alignment: .leading) {

            WebImage(url: imageUrl)
                .resizable()
                .scaledToFill()
                .frame(maxWidth: .infinity, maxHeight: 200)
                .background(.black)
                .cornerRadius(12)
                .padding(.horizontal, 36)
                .padding(.top, 20)

            HStack {

                Text(title)
                    .font(.title2)
                    .foregroundColor(.black)
                    .bold()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 38)

                Spacer()

                Image(systemName: "star.fill")
                    .resizable()
                    .scaledToFill()
                    .foregroundColor(.yellow)
                    .frame(width: 32, height: 32)


                Text(rating)
                    .font(.title3)
                    .foregroundColor(.black)
                    .bold()
                    .padding(.trailing, 38)
            }
            .padding(.bottom, 6)
        }
        .background(Color(.white))
        .cornerRadius(12)
    }
}

#Preview {
    ZStack {
        Color(.black)
        ProductCardView(title: "Product name",
                        imageUrl: URL(string: "https://cdn.kobo.com/book-images/cb230613-26e9-47e1-b622-27fb2c1cf00d/353/569/90/False/the-witcher-volume-4-of-flesh-and-flame.jpg")!,
                        rating: "4.98")
    }
}
