//
//  SearchViewController.swift
//  SearchHashTag
//
//  Created by Chae_Haram on 2022/07/12.
//

import UIKit

class SearchViewController: UIViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var hashTagListLabel: UILabel!
    
    var hashTagList: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        searchBar.delegate = self
    }

}

extension SearchViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if let text = searchBar.text, hashTagList.contains(text) {
            hashTagListLabel.text = text
        } else {
            hashTagListLabel.text = "'\(searchBar.text!)'라는 해시태그는 존재하지 않습니다."
        }
    }
}
