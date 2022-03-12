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
        if addDiaryContentTextView.text.isEmpty {
            addDiaryContentTextView.text = "내용을 입력해주세요."
            addDiaryContentTextView.textColor = .lightGray
        }
        addDiaryContentTextView.delegate = self
        
        
        title = "Add Diary"
        let rightBarButton = UIBarButtonItem(title: "완료", style: .done, target: self, action: #selector(createBarButton))
          self.navigationItem.rightBarButtonItem = rightBarButton
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
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

extension AddDiaryViewController: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.text == "내용을 입력해주세요." {
            textView.text = ""
            textView.textColor = .label
        }
    }
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = "내용을 입력해주세요."
            textView.textColor = .lightGray
        }
    }
}
