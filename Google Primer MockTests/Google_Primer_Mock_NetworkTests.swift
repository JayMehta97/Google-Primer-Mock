//
//  Google_Primer_Mock_NetworkTests.swift
//  Google Primer MockTests
//
//  Created by Jay Mehta on 07/06/20.
//  Copyright © 2020 Jay Mehta. All rights reserved.
//

@testable import Google_Primer_Mock
import XCTest

// swiftlint:disable type_name
class Google_Primer_Mock_NetworkTests: XCTestCase {
// swiftlint:enable type_name

    func test_getCardDetails() {
        let networkExpectation = self.expectation(description: "Check getCardDetails endpoint returns data without error")
        defer { waitForExpectations(timeout: 4) }

        NetworkService.request(router: .getCardDetails) { (result: Result<CardFeed, Error>) in
            defer { networkExpectation.fulfill() }

            switch result {
            case .success:
                break
            case .failure:
                XCTFail("getCardDetails API returned error")
            }
        }
    }

}
