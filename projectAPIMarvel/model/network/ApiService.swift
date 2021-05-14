//
//  ApiService.swift
//  projectAPIMarvel
//
//  Created by user194368 on 5/13/21.
//

import UIKit
import Alamofire
import CryptoKit

class ApiService {
    public static let get = HTTPMethod(rawValue: "GET")
    let baseURL: String = "http://gateway.marvel.com/v1/public/characters"
    let privateKey = "458e3dedc56e090294f35a8c16abfa63bee16b11"
    let publicKey = "d9170f7cc7317a4f78fcc0323c3c7d15"
    let ts = String(Date().timeIntervalSince1970)
    
    // MARK: - Request
    public func apiRequest() {
        
        let parameters = ["ts": ts, "hash" : self.getMD5(),  "apikey" : publicKey]
        
        let request = AF.request(baseURL, parameters: parameters)
        request.responseJSON { (data) in print(data)
        let characters = try! JSONDecoder().decode(Characters.self, from: data.data!)
            print(characters.data.results)
            
        }
    }
    // MARK: - MD5
    private func getMD5() -> String {
        let apiData = ts + privateKey + publicKey
        guard let data = apiData.data(using: .utf8) else { return String() }
        let apiHash = Insecure.MD5.hash(data: data)
        return apiHash.map { String(format: "%02hhx", $0) }.joined()
    }
    
}



