//
//  ViewController.swift
//  projectAPIMarvel
//
//  Created by user195088 on 5/12/21.
//

import UIKit
import CryptoKit
import Alamofire
import Kingfisher

class ViewController: UIViewController, UITableViewDelegate{
    @IBOutlet weak var tableView: UITableView!
    private var apiService = ApiService()
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        apiService.delegate = self
        apiService.apiRequest(id: 1)
    }
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return apiService.character.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CellTableView")
        else {return UITableViewCell()}
        if (!apiService.character.isEmpty) {
            
            cell.textLabel?.text = apiService.character[indexPath.row].name
            let url = URL(string: apiService.character[indexPath.row].thumbnail.url)
            cell.imageView?.kf.setImage(with: url)
            
        }
        return cell
        
    }
    
    
}

extension ViewController: ApiResponse {
    func success() {
        tableView.reloadData()
    }
    
    func error() {
        print("Error")
    }
}
