//
//  ProductsProviderTests.swift
//  ChallengeDevoteamTests
//
//  Created by Julio Cesar on 19/03/24.
//

import XCTest
@testable import ChallengeDevoteam

final class ProductsProviderTests: XCTestCase {

    func test_should_call_with_defined_url() throws {
        let spyClient = APIClientSpy()
        let sut = ProductsProvider(service: spyClient)
        sut.fetchProductList()
        XCTAssertEqual(spyClient.url?.absoluteString, ProductsProvider.Endpoint.products)
    }
}
