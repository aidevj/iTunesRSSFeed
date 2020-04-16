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
    static let root =
    "https://rss.itunes.apple.com/api/v1/us/apple-music"
    static let search = "/top-albums/all/100/explicit.json"
    static let searchDelay: TimeInterval = 0.5
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

    func throttleSearch(block: @escaping () -> Void) {
        // cancel the previous enqueued request
        currentSearch?.cancel()

        // define a new request
        currentSearch = DispatchWorkItem(block: block)

        // if user stops typing for a second, perform that request
        let deadline: DispatchTime = .now() + RSSConstants.searchDelay
        if let search = currentSearch {
            DispatchQueue.global(qos: .utility).asyncAfter(deadline: deadline, execute: search)
        }
    }

    // only fetches minimum details
    func search(album term: String, _ completion: @escaping FeedHandler) {
        let searchUrl = makeSearchUrl(for: term)
        throttleSearch(block: {
            self.service.get(type: FeedContainer.self, for: searchUrl, completion: completion)
        })
    }

//    func albumDetails(for albumResult: AlbumResults, _ completion: @escaping (Result<Album, APIError>) -> Void) {
//        albumDetails(for: albumResult.results, completion)
//    }

    func albumDetails(for albumUrl: String, _ completion: @escaping (Result<Album, APIError>) -> Void) {
        service.get(type: Album.self, for: albumUrl, completion: completion)
    }

    // fetch full details for user
//    func extensiveSearch(album term: String, _ completion: @escaping AlbumHandler) {
//        throttleSearch(block: {
//            self.search(album: term) { result in
//                switch result {
//                case .success(let result):
//                    self.fetchInfo(for: result.feed.self) { albums in
//                        completion(.success(album))
//                    }
//                case .failure(let apiError):
//                    completion(.failure(apiError))
//                }
//            }
//        })
//    }

//    private func fetchInfo(for albums: [AlbumResults], _ completion: @escaping ([Album]) -> Void) {
//        let group = DispatchGroup()
//        var albumInfos = [Album]()
//        let lock = NSLock()
//        for album in albums {
//            group.enter()
//            service.get(type: Album.self, for: album.results) { (result) in
//                if case let Result.success(userInfo) = result {
//                    lock.lock()
//                    userInfos.append(userInfo)
//                    lock.unlock()
//                }
//                group.leave()
//            }
//        }
//        group.notify(queue: .global(qos: .utility)) {
//            completion(albumInfos)
//        }
//    }

}

// MARK: URL Builder
extension RSSiTunesAPI {
    private func makeSearchUrl(for searchTerm: String) -> String {
        return RSSConstants.root
            + RSSConstants.search
    }
}
