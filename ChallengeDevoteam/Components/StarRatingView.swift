//
//  StarRatingView.swift
//  ChallengeDevoteam
//
//  Created by Julio Cesar on 20/03/24.
//

import SwiftUI

struct StarRatingView: View {
    var fillValue: String

    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                Rectangle()
                Rectangle()
                    .fill(Color.yellow)
                    .frame(width: geometry.size.width * self.startFillingAmount())
            }
        }
        .mask(
            Image(systemName: "star.fill")
                .resizable()
        )
        .aspectRatio(1, contentMode: .fit)
    }

    private func startFillingAmount() -> Double {
        let value = fillValue.replacingOccurrences(of: ",", with: ".")
        guard let filling = Double(value) else { return .zero }

        switch filling {
        case 0...2.9: return 0.3
        case 3...4: return 0.6
        case 4.01...5: return 1
        default: return .zero
        }
    }
}


#Preview {
    StarRatingView(fillValue: "4.06")
}
