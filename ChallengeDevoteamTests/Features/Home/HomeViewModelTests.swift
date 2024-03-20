//
//  HomeViewModelTests.swift
//  ChallengeDevoteamTests
//
//  Created by Julio Cesar on 20/03/24.
//

import XCTest
@testable import ChallengeDevoteam

final class HomeViewModelTests: XCTestCase {

    func testParser() throws {
        let sut = HomeViewModel()
        let mock = ProductData.mock()
        let model = sut.parseToModel(from: mock)

        XCTAssertNotNil(model)
        XCTAssertEqual(mock.title, model?.title)
        XCTAssertEqual(model?.discount, "8%")
        XCTAssertEqual(model?.discount, "8%")
        XCTAssertEqual(model?.price, "25,00")
    }

    func testParserFail() throws {
        let sut = HomeViewModel()
        let model = sut.parseToModel(from: .init(title: nil, rating: nil, thumbnail: nil, discountPercentage: 22, stock: 1, price: 1, description: "sdsd"))

        XCTAssertNil(model)
    }
}
