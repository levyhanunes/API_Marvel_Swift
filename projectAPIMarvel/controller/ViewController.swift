//
//  ViewController.swift
//  projectAPIMarvel
//
//  Created by user195088 on 5/12/21.
//

import UIKit
import CryptoKit
class ViewController: UIViewController {
    @IBOutlet weak var Label: UILabel!
    var apiRequest = ApiService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        apiRequest.delegate = self
        apiRequest.apiRequest(id: 1009368)
        
    }
}

 // MARK: - EXTENSION
extension ViewController: ApiResponse {
    func success() {
        Label.text = apiRequest.charactersResponse?.data.results[0].name
    }
    
    func error() {
        print("Error")
    }
    
       
    
}
