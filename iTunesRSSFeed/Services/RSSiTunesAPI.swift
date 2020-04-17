//
//  RSSiTunesAPI.swift
//  GitHubSearcher
//
//  Created by Aiden Melendez on 4/10/20.
//  Copyright © 2020. All rights reserved.
//

import Foundation

typealias FeedHandler = (Result<FeedContainer, APIError>) -> Void
typealias AlbumHandler = (Result<[Album], APIError>) -> Void

private enum RSSConstants {
    static let root = "https://rss.itunes.apple.com/api/v1/us/apple-music"
    static let top100 = "/top-albums/all/10/explicit.json"
}

class RSSiTunesAPI {

    // Example: https://rss.itunes.apple.com/api/v1/us/apple-music/top-albums/all/100/explicit.json

    private let service: APIServiceProtocol
    private var currentSearch: DispatchWorkItem?

    init(service: APIServiceProtocol) {
        self.service = service
    }
}

// MARK: Networking
extension RSSiTunesAPI {
    func fetchTop100(_ completion: @escaping FeedHandler) {
        service.get(type: FeedContainer.self, for: makeSearchUrl(), completion: completion)
    }
}

// MARK: URL Builder
extension RSSiTunesAPI {
    private func makeSearchUrl() -> String {
        RSSConstants.root + RSSConstants.top100
    }
}
