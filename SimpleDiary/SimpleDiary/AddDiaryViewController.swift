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
    
    let imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if addDiaryContentTextView.text.isEmpty {
            addDiaryContentTextView.text = "내용을 입력해주세요."
            addDiaryContentTextView.textColor = .lightGray
        }
        
        addDiaryContentTextView.delegate = self
        imagePicker.delegate = self
        
        title = "Add Diary"
        let rightBarButton = UIBarButtonItem(title: "완료", style: .done, target: self, action: #selector(createBarButton))
          self.navigationItem.rightBarButtonItem = rightBarButton
    }
    
    func showAlertSheet() {
        let alertAction = UIAlertController(title: "사진 추가하기", message: "어떤방식으로 추가하시겠습니까?", preferredStyle: .actionSheet)
        
        let cameraButton = UIAlertAction(title: "카메라", style: .default) { _ in
            print("camera on")
            self.imagePicker.sourceType = .camera
            self.present(self.imagePicker, animated: true, completion: nil)
        }
        let photoLibraryButton = UIAlertAction(title: "사진첩", style: .default) { _ in
            print("photoLibrary on")
            self.imagePicker.sourceType = .photoLibrary
            self.present(self.imagePicker, animated: true, completion: nil)
        }
//        let cameraButton = UIAlertAction(title: "카메라", style: .default, handler: nil)
//        let photoLibrary = UIAlertAction(title: "사진첩", style: .default, handler: nil)
        let cancelButton = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        
        alertAction.addAction(cameraButton)
        alertAction.addAction(photoLibraryButton)
        alertAction.addAction(cancelButton)
        
        self.present(alertAction, animated: true, completion: nil)
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
        showAlertSheet()
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

extension AddDiaryViewController: UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    
}
