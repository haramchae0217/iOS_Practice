//
//  AddMemoViewController.swift
//  MemoTableViewPracticeAgain
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
        addMemoTextView.text = addMemo?.memoTitle
        
    }
    
    @IBAction func addMemoButton(_ sender: UIBarButtonItem) {
        let addMemo = addMemoTextView.text!
        let addDate = DateFormatter.customDateFormatter.string(from: Date())
        
        if addMemo.isEmpty {
            UIAlertController.showAlert(message: "메모를 입력해주세요.", vc: self)
            return
        }
        
        let addMemoList = Memo(memoTitle: addMemo, memoDate: addDate)
        Memo.memoList.append(addMemoList)
        
        self.navigationController?.popViewController(animated: true)
    }
    

}
