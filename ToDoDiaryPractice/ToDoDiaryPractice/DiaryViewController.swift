//
//  DiaryViewController.swift
//  ToDoDiaryPractice
//
//  Created by Chae_Haram on 2022/03/18.
//

import UIKit

class DiaryViewController: UIViewController {

    @IBOutlet weak var diaryTitleTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Diary"
        
        let doneRightBarButton = UIBarButtonItem(title: "완료", style: .done, target: self, action: #selector(addDiaryBarButton))
        self.navigationItem.rightBarButtonItem = doneRightBarButton
    }
    @objc func addDiaryBarButton() {
        let diaryTitle = diaryTitleTextField.text!
        let newDiary = Item(type: "Diary", title: diaryTitle)
        
        Item.itemData.append(newDiary)
        self.navigationController?.popViewController(animated: true)
    }
    

}
