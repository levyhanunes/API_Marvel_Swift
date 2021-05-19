//
//  ViewController.swift
//  projectAPIMarvel
//
//  Created by user195088 on 5/12/21.
//

import UIKit
import CryptoKit

class ViewController: UIViewController {

    
    var apiRequest = ApiServicee()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        apiRequest.apiRequest()
        
    }


}

