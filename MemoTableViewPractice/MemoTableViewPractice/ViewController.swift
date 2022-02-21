//
//  ViewController.swift
//  MemoTableViewPractice
//
//  Created by Chae_Haram on 2022/02/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var memoTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        memoTableView.dataSource = self
        memoTableView.delegate = self
    }
    override func viewWillAppear(_ animated: Bool) {
        memoTableView.reloadData()
    }

}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Memo.memoList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let memoCell = tableView.dequeueReusableCell(withIdentifier: "memoTVC", for: indexPath) as? MemoTableViewCell else { return UITableViewCell() }
        let memo = Memo.memoList[indexPath.row]
        memoCell.memoListLabel.text = memo.title
        
        return memoCell
        
    }
    
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
   
}
