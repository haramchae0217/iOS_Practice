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
        if let text = searchBar.text {
            var matches: [String] = []
            matches = hashTagList.filter { $0.contains(text) }
            
            var hashtags: String = ""
            for i in 0..<matches.count {
                if i == matches.count - 1 {
                    hashtags.append("#\(matches[i])")
                    break
                }
                hashtags.append("#\(matches[i]), ")
            }
            
            hashTagListLabel.text = hashtags
        } else {
            hashTagListLabel.text = "'\(searchBar.text!)'라는 해시태그는 존재하지 않습니다."
        }
    }
}


