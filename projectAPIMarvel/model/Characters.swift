//
//  Characters .swift
//  projectAPIMarvel
//
//  Created by user194368 on 5/13/21.
//

import Foundation

// MARK: - Characters
struct Characters: Codable {
    let status, copyright, attributionText: String
    let code: Int
    let attributionHTML: String
    let data: DataClass
    let etag: String
}

// MARK: - DataClass
struct DataClass: Codable {
    let offset, limit, total, count: Int
    let results: [Result]
}

// MARK: - Result
struct Result: Codable {
    let name, resultDescription: String
    let id: Int
    let resourceURI: String

    enum CodingKeys: String, CodingKey {
        case id, name
        case resultDescription = "description"
        case resourceURI
    }
}
