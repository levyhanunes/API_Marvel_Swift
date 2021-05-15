//
//  ViewController.swift
//  projectAPIMarvel
//
//  Created by user195088 on 5/12/21.
//

import UIKit
import CryptoKit
class ViewController: UIViewController {
    var apiRequest = ApiService()
    override func viewDidLoad() {
        super.viewDidLoad()
        apiRequest.apiRequest2(name: "Iron%20Man")
        // Do any additional setup after loading the view.
    }


}

