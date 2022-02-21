//
//  AddMemoViewController.swift
//  MemoTableViewPractice
//
//  Created by Chae_Haram on 2022/02/21.
//

import UIKit

class AddMemoViewController: UIViewController {

    @IBOutlet weak var addMemoTextView: UITextView!
    
    var addMemo: Memo?
    var row: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addMemoTextView.text = addMemo?.title
    
    }
    
    @IBAction func addMemoBarButtonItem(_ sender: UIBarButtonItem) {
        let addTitle = addMemoTextView.text!
        
        if addTitle.isEmpty {
            UIAlertController.showAlert(message: "메모를 입력해주세요.", vc: self)
            return
        }
        
        let newMemo = Memo(title: addTitle)
        Memo.memoList.append(newMemo)
        
        self.navigationController?.popViewController(animated: true)
        
    }
    

}
