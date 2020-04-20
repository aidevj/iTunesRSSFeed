//
//  Album.swift
//  iTunesRSSFeed
//
//  Created by Aiden Melendez on 4/15/20.
//  Copyright © 2020. All rights reserved.
//

import Foundation

struct FeedContainer: Decodable {
    let feed: AlbumResults
}

struct AlbumResults: Decodable {
    let results: [Album]
}

struct Album: Decodable {
    let name: String
    let artistName: String
    let artworkUrl: String?
    let genres: [Genre]
    let url: String?
    let releaseDate: String?
    let copyright: String

    private enum CodingKeys: String, CodingKey {
        case name, artistName
        case artworkUrl = "artworkUrl100"
        case genres, url, releaseDate, copyright
    }
}

struct Genre: Decodable {
    let name: String
}
