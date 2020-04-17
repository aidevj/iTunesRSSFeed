//
//  Foundation+Utility.swift
//  iTunesRSSFeed
//
//  Created by Consultant on 4/17/20.
//  Copyright © 2020 MAC. All rights reserved.
//

import Foundation

extension Array {
    public subscript(safely index: Int) -> Element? {
        guard index >= 0 && index < count else { return nil }
        return self[index]
    }
}
