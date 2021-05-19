//
//  NetworkService.swift
//  iMarvel
//
//  Created by user195088 on 5/15/21.
//

import UIKit
import Alamofire
import CryptoKit

class ApiService {
    
    
    public static let get = HTTPMethod(rawValue: "GET")
    
    
    let privateKey = "458e3dedc56e090294f35a8c16abfa63bee16b11"
    let publicKey = "d9170f7cc7317a4f78fcc0323c3c7d15"
    let ts = String(Date().timeIntervalSince1970)
    
    // MARK: - Reques
    // MARK: - Request2
    public func apiRequest2(name : String) {
        
        let parameters = ["ts": ts, "hash" : self.getMD5(),  "apikey" : publicKey]
        let baseURL: String = "http://gateway.marvel.com/v1/public/characters?name=\(name)"
        let request = AF.request(baseURL, parameters: parameters)
        request.responseJSON { (data) in print(data)
        
            
        }
    }
    
    
    // MARK: - Search Request
    
    static let shared = ApiService()
    
  
    
    public func buscaCharacters2(texto: String, completion: @escaping (ReturnApi?, Error?) -> ()){
        
        guard let url = URL(string: "http://gateway.marvel.com/v1/public/characters?ts=\(ts)&apikey=\(publicKey)&hash=\(getMD5())&nameStartsWith=\(texto)")  else {return}
        
        URLSession.shared.dataTask(with: url) { (data, resp, err) in
            if let err = err {
                completion(nil, err)
                return
            }
            
            do {
                guard let data = data else {return}
                let characters = try JSONDecoder().decode(ReturnApi.self, from: data)
                completion(characters, nil)
                
            } catch let err {
                completion(nil, err)
                return
            }
        }.resume()
    }
    
    
    
    
    
    
    
    // MARK: - MD5
         func getMD5() -> String {
            
        let apiData = ts + privateKey + publicKey
        guard let data = apiData.data(using: .utf8) else { return String() }
        let apiHash = Insecure.MD5.hash(data: data)
        return apiHash.map { String(format: "%02hhx", $0) }.joined()
    }
}



