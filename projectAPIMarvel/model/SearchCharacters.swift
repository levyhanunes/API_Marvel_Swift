//
//  SearchResults.swift
//  projectAPIMarvel
//
//  Created by user195088 on 5/13/21.
//

import UIKit

struct  APIResults : Codable{
    var data: APICharacterData
}

struct APICharacterData : Codable {
    var count: Int
    var results: [Character]
}

struct Character : Identifiable, Codable{
    var id: Int
    var name: String
    var description: String
    var thumbnail: [String:String]
    var urls: [String:String]
}
