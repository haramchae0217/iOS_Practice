//
//  addVCViewController.swift
//  ImageAddPractice
//
//  Created by Chae_Haram on 2022/03/16.
//

import UIKit

class AddVCViewController: UIViewController {

    @IBOutlet weak var addPictureImageView: UIImageView!
    @IBOutlet weak var addTitleTextField: UITextField!
    // UI 선언
    
    let imagePicker = UIImagePickerController()
    // imagePicker 함수 대입
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagePicker.delegate = self
        // imagePicker delegate 선언 필수
        addPictureImageView.contentMode = .scaleAspectFill
        // imageView 크기 설정

        let rightBarButtonItem = UIBarButtonItem(title: "완료", style: .done, target: self, action: #selector(createBarButton))
        self.navigationItem.rightBarButtonItem = rightBarButtonItem
        // rightBarButtonItem 제작
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
        // view 터치해서 화면 내리기
    }
    
    @objc func createBarButton() {
        Photo.photoData.picture = addPictureImageView.image!
        Photo.photoData.title = addTitleTextField.text!
        self.navigationController?.popViewController(animated: true)
        // rightBarButton 설정
    }
    
    func showAlertSheet() {
        let alertAction = UIAlertController(title: "사진 추가하기", message: "어떤 방식으로 추가하시겠습니까?", preferredStyle: .actionSheet)
        
        let cameraButton = UIAlertAction(title: "카메라", style: .default)
        let photoLibrary = UIAlertAction(title: "사진첩", style: .default) {_ in
            self.imagePicker.sourceType = .photoLibrary
            self.present(self.imagePicker, animated: true, completion: nil)
        }
        let cancelButton = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        
        alertAction.addAction(cameraButton)
        alertAction.addAction(photoLibrary)
        alertAction.addAction(cancelButton)
        
        self.present(alertAction, animated: true, completion: nil)
        // action sheet 설정
    }
    
    @IBAction func addPictureButton(_ sender: UIButton) {
        showAlertSheet()
        
    }
    
   

}

extension AddVCViewController: UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            addPictureImageView.image = image
            Photo.photoData.picture = image
            // 사진 선택한 후 일어날 행동 적기
        } else {
            print("")
        }
        self.dismiss(animated: true, completion: nil)
    }
}
