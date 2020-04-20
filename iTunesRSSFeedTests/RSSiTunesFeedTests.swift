//
//  RSSiTunesFeedTests.swift
//  RSSiTunesFeedTests
//
//  Created by Consultant on 4/15/20.
//  Copyright © 2020. All rights reserved.
//

import XCTest
@testable import iTunesRSSFeed

// swiftlint:disable
class RSSiTunesFeedTests: XCTestCase {

    func testCanDecodeAlbumModels() {
        // Arrange
        let rssiTunesAPI = RSSiTunesAPI(service: MockAPIService())
        
        // Act
        var albums: [Album]?
        let expectation = XCTestExpectation(description: "testCanDecodeAlbumsModel")
        rssiTunesAPI.fetchTop100({ (result) in
            switch result {
            case .success(let result):
                albums = result.feed.results
            case .failure(let apiError):
                XCTFail(apiError.localizedDescription)
            }
            expectation.fulfill()
        })
        wait(for: [expectation], timeout: 4.0)

        // Assert
        XCTAssertNotNil(albums, "Error - nil returned for Albums")
        XCTAssertFalse(albums?.isEmpty ?? false, "Error - albums is empty")
        XCTAssertEqual(albums?.count ?? 0, 10, "Error - decoded incorrect number of albums")
    }

}
