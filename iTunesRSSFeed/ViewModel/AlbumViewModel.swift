//
//  AlbumViewModel.swift
//  iTunesRSSFeed
//
//  Created by Aiden Melendez on 4/17/20.
//  Copyright © 2020. All rights reserved.
//

import Foundation

class AlbumViewModel {
    
    private var album: Album {
        didSet {
            self.updateHandler?()
        }
    }
    
    private let pictureCache: PictureCache
    private var updateHandler: UpdateHandler?
    
    init(album: Album, pictureCache: PictureCache = PictureCache()) {
        self.album = album
        self.pictureCache = pictureCache
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
    
}

extension AlbumViewModel {
    
    var url: URL? {
        guard let urlString = album.url else { return nil }
        return URL(string: urlString)
    }
    
    var name: String {
        "Album Name: " + album.name
    }
    
    var artistName: String {
        "Artist: " + album.artistName
    }
    
    func image(_ completion: @escaping (Data?) -> Void) {
        guard let urlString = album.artworkUrl,
            let url = URL(string: urlString) else {
            completion(nil)
            return
        }
        pictureCache.get(url, completion)
    }
    
    var genre: String {
        "Genre: " + album.genres.map { $0.name }.joined(separator: " ")
    }
    
    var releaseDate: String {
        "Release Date: " + (album.releaseDate ?? "unknown")
    }
    
    var copyright: String {
        album.copyright
    } 

}
