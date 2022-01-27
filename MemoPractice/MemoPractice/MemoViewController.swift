//
//  MemoViewController.swift
//  MemoPractice
//
//  Created by Chae_Haram on 2022/01/27.
//

import UIKit

class MemoViewController: UIViewController {

    @IBOutlet weak var memoTextView: UITextView!
    
    var memo: String?
    var row: Int? //몇번째 정보인지 == tableView에 몇번째에 있는지
    
    func getDateToString(date: Date, format: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        dateFormatter.timeZone = NSTimeZone(name: "ko_KR") as TimeZone?
        
        return dateFormatter.string(from: date)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        createRightBarButtonItem()
        memoTextView.text = memo
        
    }
    
    func createRightBarButtonItem() {
        let rightBarButton: UIBarButtonItem = UIBarButtonItem(title: "수정하기",style: .done, target: self, action: #selector(updateButtonClicked))
        self.navigationItem.rightBarButtonItem = rightBarButton
    }
    @objc func updateButtonClicked(){
        guard let mainVC = self.storyboard?.instantiateViewController(withIdentifier: "mainVC") as? ViewController else { return }
        if let row = row {
            mainVC.memoTitle[row] = memoTextView.text!
            //mainVC.memoDate[row] = getDateToString(date: Date, format: String)()
            self.navigationController?.pushViewController(mainVC, animated: true)
        } else { print("인덱스 값이 비어있음 ")}
    }

}

