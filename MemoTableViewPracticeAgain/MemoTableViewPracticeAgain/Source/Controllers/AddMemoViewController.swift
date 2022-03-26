//
//  AddMemoViewController.swift
//  MemoTableViewPracticeAgain
//
//  Created by Chae_Haram on 2022/02/21.
//

import UIKit

class AddMemoViewController: UIViewController {

    @IBOutlet weak var addMemoTextView: UITextView!
    
    var editMemo: Memo?
    var row: Int?
    var viewType: ViewType = .add
    var addBarButton: String = "추가"
    var editBarButton: String = "수정"
    
    enum ViewType {
        case add
        case edit
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addMemoTextView.text = editMemo?.memoTitle
        
        if viewType == .add {
            title = "새로운 메모"
            let rightBarButton = UIBarButtonItem(title: addBarButton, style: .done, target: self, action: #selector(doneBarButton))
            self.navigationItem.rightBarButtonItem = rightBarButton
        } else {
            title = "메모 수정"
            let rightBarButton = UIBarButtonItem(title: editBarButton, style: .done, target: self, action: #selector(doneBarButton))
            self.navigationItem.rightBarButtonItem = rightBarButton
        }
        
    }
    
    @objc func doneBarButton() {
        let memo = addMemoTextView.text!
        let date = DateFormatter.customDateFormatter.string(from: Date())
        let newMemo = Memo(memoTitle: memo, memoDate: date)
        
        if viewType == .add {
            MyDB.memoList.append(newMemo)
        } else {
            if let indexPathrow = row {
                MyDB.memoList[indexPathrow] = newMemo
            }
        }
        self.navigationController?.popViewController(animated: true)
    }

}
