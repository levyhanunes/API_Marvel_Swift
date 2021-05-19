//
//  ViewController.swift
//  projectAPIMarvel
//
//  Created by user195088 on 5/12/21.
//

import UIKit
import CryptoKit
import Alamofire

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



extension ViewController :UITableViewDataSource, ApiResponse
{
    func success() {
        tableView.reloadData()
    }
    
    func error() {
        print("Error")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return apiService.character.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellTableView")
        if (apiService.character.count > 0){
            do{
                cell?.textLabel?.text = apiService.character[indexPath.row].name
        }}
        return cell!
    }
    
    
}

//
// // MARK: - EXTENSION
//extension ViewController: ApiResponse, UITableViewDataSource {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        apiRequest.charactersResponse!.data.results.count
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "CellModel", for: indexPath)
//        cell.textLabel?.text  = apiRequest.charactersResponse?.data.results[indexPath.row].name
//        return cell
//    }
//
//
//    func success() {
//
//    }
//
//    func error() {
//        print("Error")
//    }
//
//
//
//
//
//}
