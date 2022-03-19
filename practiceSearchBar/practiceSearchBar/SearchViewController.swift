//
//  ViewController.swift
//  practiceSearchBar
//
//  Created by Chae_Haram on 2022/03/19.
//

import UIKit

class SearchViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var alienList: [String] = ["breqrains", "ghivval", "krel", "throngraks", "hummur", "elgan", "one", "dalmi", "comad", "bognaer", "equd", "trexeid", "thraerex", "vuuczils", "henairs"]
    var filteredList: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "이름 검색"
        
        tableView.dataSource = self
        tableView.delegate = self
        
    // searchController
        let searchController = UISearchController()
        searchController.delegate = self
        tableView.tableHeaderView = searchController.searchBar
    }

}

extension SearchViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if filteredList.isEmpty {
            return alienList.count
        } else {
            return filteredList.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SearchTableViewCell.identifier, for: indexPath) as? SearchTableViewCell else { return UITableViewCell() }
        if filteredList.isEmpty{
            cell.searchLabel.text = alienList[indexPath.row]
        } else {
            cell.searchLabel.text = filteredList[indexPath.row]
        }
        
        return cell
    }
}

extension SearchViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}

extension SearchViewController: UISearchControllerDelegate {
    
}
