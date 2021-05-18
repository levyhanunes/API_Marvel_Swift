//
//  Characters .swift
//  projectAPIMarvel
//
//  Created by user194368 on 5/13/21.
//

import Foundation

 // MARK: - ReturnApi
 struct ReturnApi: Decodable {
     let copyright, attributionText: String
     let code : Int
     let attributionHTML: String
     let data: DataClass
     let etag: String
 }

 // MARK: - DataClass
 struct DataClass: Decodable {
     let offset, limit, total, count: Int
     let results: [Result]
 }

 // MARK: - Result
 struct Result: Decodable {
    let id: Int
    let modified, name, resourceURI, description: String
    let thumbnail: Thumbnail
    
    enum CodingKeys: String, CodingKey{
        case id
        case modified, name, resourceURI, thumbnail, description
 }
}

//MARK: - Thumbnail

struct Thumbnail: Decodable {
    let path, fileExtension: String
    
    enum CodingKeys: String, CodingKey{
        case fileExtension = "extension", path
    }
}
