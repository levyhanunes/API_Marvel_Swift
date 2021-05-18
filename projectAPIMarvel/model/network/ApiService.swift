//
//  ApiService.swift
//  projectAPIMarvel
//
//  Created by user194368 on 5/13/21.
//

import UIKit
import Alamofire
import CryptoKit

protocol ApiResponse {
    func success()
    func error()
}


class ApiService {
    let privateKey = "458e3dedc56e090294f35a8c16abfa63bee16b11"
    let publicKey = "d9170f7cc7317a4f78fcc0323c3c7d15"
    let ts = String(Date().timeIntervalSince1970)
    var charactersResponse: ReturnApi?
    var delegate: ApiResponse?
    
    // MARK: - Request
    
    public func apiRequest(id: Int){
        let parameters = ["ts": ts, "hash" : self.getMD5(),  "apikey" : publicKey]
        let baseURL: String = "http://gateway.marvel.com/v1/public/characters"
        let request = AF.request(baseURL, parameters: parameters)
        request.responseDecodable(of: ReturnApi.self){ result in
            guard let characters = result.value else {return}
            print(characters)
            self.charactersResponse = characters
            if (self.charactersResponse == nil) {
                
                self.delegate?.error()
            }
            self.delegate?.success()
            
        }
        
    }
    // MARK: - Request2
    public func apiRequest2(name : String) {
        
        let parameters = ["ts": ts, "hash" : self.getMD5(),  "apikey" : publicKey]
        let baseURL: String = "http://gateway.marvel.com/v1/public/characters?name=\(name)"
        let request = AF.request(baseURL, parameters: parameters)
        request.responseDecodable(of: ReturnApi.self){ result in
            guard let characters = result.value else {return}
            
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



