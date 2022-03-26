//
//  ViewController.swift
//  SlangQuiz
//
//  Created by Chae_Haram on 2022/03/24.
//

import UIKit
/*
 1. searchController 연결하기
 2. 검색어와 완전히 일치하는 항목 거르기
    - 완전히 일치하는 단어가 없을 시에는 "혹시 찾으시는 단어가 이중에 있나요?" 라는 문구와 함께 해당 검색어가 포함된 slang 목록(short name)을 띄워준다.
 3. 검색어와 일치하는 항목을 shortNameLabel, fullNameLabel에 출력하기
 4. AddVC추가하기
 5. BarButtonItem 구현하기
 6. AddVC - textField 두개로 신조어와 뜻 받아오기
 7. 검색했을 때 뜨도록 구현하기.
 */

class ViewController: UIViewController {

    // MARK: UI
    @IBOutlet weak var shortNameLabel: UILabel!
    @IBOutlet weak var fullNameLabel: UILabel!
    
    var matchWord: Slang?
    
    // MARK: View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "신조어 검색기"
        
        let searchNameController = UISearchController(searchResultsController: nil)
        searchNameController.searchBar.delegate = self
        searchNameController.searchResultsUpdater = self
        searchNameController.searchBar.placeholder = "신조어를 입력해보세요!"
        navigationItem.searchController = searchNameController
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //shortNameLabel.text = MyDB.slangList.
        
    }
    
    // MARK: Action
    @IBAction func rightBarButton(_ sender: UIBarButtonItem) {
    }
    

}

extension ViewController: UISearchBarDelegate, UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        // 검색어에 따른 실시간 검색 결과 도출
        // 일치하는 결과가 있으면 shortName & fullName 띄워주기
        if let searchText = searchController.searchBar.text {
            matchWord = MyDB.slangList.filter{ $0.shortName == searchText }.first
//            if let word = matchWord {
//                shortNameLabel.text = word.shortName
//                fullNameLabel.text = word.fullName
//
//                matchWord = nil
//            } else {
//                shortNameLabel.text = "일치하는"
//                fullNameLabel.text = "결과가 없어요"
//            }
        }
    }
    
    // 취소버튼 눌렀을 때
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        shortNameLabel.text = "신조어를"
        fullNameLabel.text = "검색해보세요"
    }
    // 검색버튼 눌렀을 때
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if let word = matchWord {
            shortNameLabel.text = word.shortName
            fullNameLabel.text = word.fullName
            
            matchWord = nil
        } else {
            shortNameLabel.text = "일치하는"
            fullNameLabel.text = "결과가 없어요"
        }
        
    }
    
}
