//
//  APIService.swift
//  projectAPIMarvel
//
//  Created by Levy Henrique on 5/13/21.
//

import UIKit
import Alamofire
import CryptoKit

class ApiService {
    
    
    public func searchCharacter(){
        
        let ts = String(Date().timeIntervalSince1970)
        let hash = MD5(data: "\(ts)\(privateKey)\(apiKey)")
        let url = "https://gateway.marvel.com:443/v1/public/characters?ts=\(ts)&apiKey=\(apiKey)&hash=\(hash)"
        
        let parameters = ["ts": ts, "hash" : hash,  "apikey" : apiKey]
        let request = AF.request(url, parameters: parameters)
        // 2
        request.responseJSON { (data) in
            print(data)
            
        }
    }
    
    
        

    
    
    private func MD5(data: String) -> String{
        
        
        let hash = Insecure.MD5.hash(data: data.data(using: .utf8) ?? Data())
        
        return hash.map{
        String(format: "%02hhx", $0)
    }
        .joined()
    }
}
