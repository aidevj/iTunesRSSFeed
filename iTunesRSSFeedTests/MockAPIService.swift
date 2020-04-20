//
//  RSSiTunesFeedTests.swift
//  RSSiTunesFeedTests
//
//  Created by Consultant on 4/17/20.
//  Copyright © 2020. All rights reserved.
//

import Foundation
@testable import iTunesRSSFeed

enum MockData: String {
    
    case top100 = "https://rss.itunes.apple.com/api/v1/us/apple-music/top-albums/all/10/explicit.json"
    
    var fileName: String {
        switch self {
        case .top100:
            return "MockJSONData"
        default:
            fatalError("Invalid filename found")
        }
    }
    
    func getUrl() throws -> URL {
        let fileName = self.fileName.components(separatedBy: ".json").joined()
        guard let path = Bundle(for: MockAPIService.self).path(forResource: fileName,
                                                               ofType: ".json") else {
            throw APIError.badURL("Invalid test file")
        }
        return URL(fileURLWithPath: path)
    }
    
}

class MockAPIService: APIServiceProtocol {
    
    func get<T: Decodable>(type: T.Type,
                           for url: URL,
                           completion: @escaping (Result<T, APIError>) -> Void) {
        get(type: type, for: url.absoluteString, completion: completion)
        
    }
    
    func get<T: Decodable>(type: T.Type,
                           for urlString: String,
                           completion: @escaping (Result<T, APIError>) -> Void) {
        guard let mockData = MockData(rawValue: urlString) else {
            completion(.failure(.badURL("Invalid test case")))
            return
        }
        do {
            let url = try mockData.getUrl()
            let data = try Data(contentsOf: url)
            let results = try JSONDecoder().decode(type, from: data)
            completion(.success(results))
        } catch APIError.badURL(let errString) {
            completion(.failure(.badURL(errString)))
        } catch {
            completion(.failure(.badDecoder("Could not decode test file")))
        }
    }
    
}
