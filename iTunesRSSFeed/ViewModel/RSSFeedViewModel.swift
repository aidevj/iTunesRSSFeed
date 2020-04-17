//
//  RSSFeedViewModel.swift
//  iTunesRSSFeed
//
//  Created by Aiden Melendez on 4/15/20.
//  Copyright © 2020. All rights reserved.
//

import Foundation

typealias UpdateHandler = () -> Void

class RSSFeedViewModel {

    private var albums = [Album]() {
        didSet {
            self.updateHandler?()
        }
    }

    private let service: APIServiceProtocol
    private let iTunesAPI: RSSiTunesAPI
    private let pictureCache: PictureCache
    private var updateHandler: UpdateHandler?

    init(pictureCache: PictureCache = PictureCache(),
         service: APIServiceProtocol = APIService()) {
        self.pictureCache = pictureCache
        self.service = service
        iTunesAPI = RSSiTunesAPI(service: service)
    }
    
    func bind(_ handler: @escaping UpdateHandler) {
        updateHandler = handler
    }
    
    func bindAndFire(_ handler: @escaping UpdateHandler) {
        updateHandler = handler
        handler()
    }
    
    func unbind() {
        updateHandler = nil
    }
    
    func getFeed() {
        iTunesAPI.fetchTop100 { result in
            switch result {
            case .success(let feedContainer):
                self.albums = feedContainer.feed.results
            case .failure(let error):
                // TODO: handle this later
                print(error.localizedDescription)
            }
            
        }
    }
    
}

extension RSSFeedViewModel {
    
    var count: Int {
        albums.count
    }
    
    func url(for index: Int) -> URL? {
        guard let urlString = albums[safely: index]?.url else { return nil }
        return URL(string: urlString)
    }
    
    func name(for index: Int) -> String? {
        albums[safely: index]?.name
    }
    
    func artistName(for index: Int) -> String? {
        albums[safely: index]?.artistName
    }
    
    func image(for index: Int, _ completion: @escaping (Data?) -> Void) {
        guard let urlString = albums[safely: index]?.artworkUrl,
            let url = URL(string: urlString) else {
                completion(nil)
                return
        }
        pictureCache.get(url, completion)
    }
    
    func makeAlbumViewModel(for index: Int) -> AlbumViewModel? {
        guard let album = albums[safely: index] else { return nil }
        return AlbumViewModel(album: album, pictureCache: pictureCache)
    }
    
}
