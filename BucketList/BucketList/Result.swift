//
//  Result.swift
//  BucketList
//
//  Created by Galih Samudra on 26/09/24.
//

import Foundation

struct Result: Codable {
    let query: Query
}

struct Query: Codable {
    let pages: [Int: Page]
}

struct Page: Codable {
    let pageid: Int
    let title: String
    let terms: [String: [String]]?
    
    var description: String {
        return terms?["description"]?.first ?? "No further information"
    }
}

extension Page: Comparable {
    static func < (lhs: Page, rhs: Page) -> Bool {
        lhs.title < rhs.title
    }
}
