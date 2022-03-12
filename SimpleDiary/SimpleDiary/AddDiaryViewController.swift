//
//  AddDiaryViewController.swift
//  SimpleDiary
//
//  Created by Chae_Haram on 2022/03/12.
//

import UIKit

class AddDiaryViewController: UIViewController {

    @IBOutlet weak var addDiaryImageView: UIImageView!
    @IBOutlet weak var addDiaryContentTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Add Diary"
        let rightBarButton = UIBarButtonItem(title: "완료", style: .done, target: self, action: #selector(createBarButton))
          self.navigationItem.rightBarButtonItem = rightBarButton
    }
    
        @objc func createBarButton() {
            //textView에 있는 글씨는 이전화면으로 titleLabel에 대입
            Diary.diaryData.content = addDiaryContentTextView.text
            Diary.diaryData.date = Date()
            self.navigationController?.popViewController(animated: true)
        }
    
    @IBAction func addPictureButton(_ sender: UIButton) {
        
    }
    
    
    

}
