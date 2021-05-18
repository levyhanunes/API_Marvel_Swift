//
//  ViewController.swift
//  projectAPIMarvel
//
//  Created by user195088 on 5/12/21.
//

import UIKit
import CryptoKit
class ViewController: UIViewController{
    @IBOutlet weak var tableView: UITableView!
    var apiRequest = ApiService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        apiRequest.delegate = self
        tableView.dataSource = self
        apiRequest.apiRequest(id: 1009368)

       
    }
}

 // MARK: - EXTENSION
extension ViewController: ApiResponse, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        apiRequest.charactersResponse!.data.results.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellModel", for: indexPath)
        cell.textLabel?.text  = apiRequest.charactersResponse?.data.results[indexPath.row].name
        return cell
    }
    

    func success() {
        
    }
    
    func error() {
        print("Error")
    }
    


       
    
}
