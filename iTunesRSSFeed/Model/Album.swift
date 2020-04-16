//
//  Album.swift
//  iTunesRSSFeed
//
//  Created by Aiden Melendez on 4/15/20.
//  Copyright © 2020. All rights reserved.
//

import Foundation

struct Feed: Decodable {
    let feed: Results
}

struct Results: Decodable {
    let results: [Album]
}

struct Album: Decodable {
    let name: String?
    let artistName: String?
    let artworkUrl: String?
    let url: String?

    private enum CodingKeys: String, CodingKey {
        case name, artistName, url
        case artworkUrl = "artworkUrl100"
    }
}
