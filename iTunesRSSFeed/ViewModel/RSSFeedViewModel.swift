//
//  RSSFeedViewModel.swift
//  iTunesRSSFeed
//
//  Created by Aiden Melendez on 4/15/20.
//  Copyright © 2020 MAC. All rights reserved.
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
    private let pictureCache: PictureCache
    private var updateHandler: UpdateHandler?

    init(albums: [Album],
         pictureCache: PictureCache = PictureCache(),
         service: APIServiceProtocol = APIService()) {
        self.albums = albums
        self.pictureCache = pictureCache
        self.service = service
    }
}
