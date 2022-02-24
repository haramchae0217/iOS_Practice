//
//  EditMemoUIViewController.swift
//  MemoTableViewPracticeAgain
//
//  Created by Chae_Haram on 2022/02/22.
//

import UIKit

class EditMemoUIViewController: UIViewController {

    @IBOutlet weak var editMemoTextView: UITextView!
    
    var editMemo: Memo?
    var row: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createRightBarButtonItem()
        editMemoTextView.text = editMemo?.memoTitle
        
    }
    
    func createRightBarButtonItem() {
        let rightBarButton: UIBarButtonItem = UIBarButtonItem(title: "수정", style: .done, target: self, action: #selector(updateButtonClicked))
        self.navigationItem.rightBarButtonItem = rightBarButton
    }
    
    @objc func updateButtonClicked() {
        let editMemo = editMemoTextView.text!
        let editDate = DateFormatter.customDateFormatter.string(from: Date())
        
        if editMemo.isEmpty {
            UIAlertController.showAlert(message: "메모를 변경하세요.", vc: self)
            return
        }
        //let editMemoList = Memo(memoTitle: editMemo, memoDate: editDate)
        if let row = row {
            Memo.memoList[row].memoTitle = editMemo
            Memo.memoList[row].memoDate = editDate
        }
        
        
        self.navigationController?.popViewController(animated: true)
    }

}
