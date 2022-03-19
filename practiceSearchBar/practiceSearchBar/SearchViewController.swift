//
//  ViewController.swift
//  practiceSearchBar
//
//  Created by Chae_Haram on 2022/03/19.
//

import UIKit

class SearchViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    let alienList: [String] = ["breqrains", "ghivval", "krel", "throngraks", "hummur", "elgan", "one", "dalmi", "comad", "bognaer", "equd", "trexeid", "thraerex", "vuuczils", "henairs"]
    var filteredList: [String] = []
    //var searchController = UISearchController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "이름 검색"
        filteredList = alienList
        
        tableView.dataSource = self
        tableView.delegate = self
        
    // searchController
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchResultsUpdater = self
        //controller.delegate = self
        searchController.searchBar.delegate = self
        //tableView.tableHeaderView = controller.searchBar
        searchController.searchBar.placeholder = "이름을 입력하세요."
        navigationItem.hidesSearchBarWhenScrolling = false
        navigationItem.searchController = searchController
        
        //searchController = controller
    }
}

extension SearchViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return filteredList.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SearchTableViewCell.identifier, for: indexPath) as? SearchTableViewCell else { return UITableViewCell() }
//        if filteredList.isEmpty{
//            cell.searchLabel.text = alienList[indexPath.row]
//        } else {
//            cell.searchLabel.text = filteredList[indexPath.row]
//        }
        if !filteredList.isEmpty {
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

extension SearchViewController: UISearchControllerDelegate, UISearchResultsUpdating, UISearchBarDelegate {
    func updateSearchResults(for searchController: UISearchController) {
        if let text = searchController.searchBar.text{
            print("검색어 : ",text)
            self.filteredList = self.alienList.filter{ $0.lowercased().contains(text)}
            print("필터링 : ",filteredList)
        } else {
            print("text 존재 안함.")
        }
    }
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        tableView.reloadData()
    }
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        filteredList = alienList
        tableView.reloadData()
    }
    
}

