//
//  ViewController.swift
//  SaveImage
//
//  Created by Chae_Haram on 2022/09/08.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    let imagePicker = UIImagePickerController()
    var image: UIImage? = nil
    var imageCount: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.image = UIImage(systemName: "folder.fill")
        configureUD()
        configureImagePicker()
    }
    
    func configureUD() {
        if let imageNumber = UserDefaults.standard.string(forKey: "imageNumber"), let count = Int(imageNumber) {
            imageCount = count
        } else {
            UserDefaults.standard.set("0", forKey: "")
        }
    }
    
    func configureImagePicker() {
        self.imagePicker.sourceType = .photoLibrary
        self.imagePicker.allowsEditing = true
        self.imagePicker.delegate = self
    }

    @IBAction func moveViewControllerClicked(_ sender: UIBarButtonItem) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "imageVC") as? SaveImageListViewController else { return }
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func getImageButtonClicked(_ sender: UIButton) {
        self.present(self.imagePicker, animated: true)
    }
    

    @IBAction func saveImageButtonClicked(_ sender: UIButton) {
        guard let image = imageView.image else { return }
        
        ImageManager.shared.saveImage(image: image, pathName: "\(imageCount).jpg") { onSuccess in
            if onSuccess {
                print("저장 완료")
                self.imageCount += 1
                UserDefaults.standard.set("\(self.imageCount)", forKey: "imageNumber")
                self.showAlert(title: "👌", msg: "이미지가 저장되었습니다.")
            } else {
                print("저장 실패")
                self.showAlert(title: "🖕", msg: "이미지 저장에 실패하였습니다.")
            }
        }
    }
    
    @IBAction func deleteImageButtonClicked(_ sender: UIButton) {
    
    }
    
}
extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        var newImage: UIImage? = nil
        
        if let possibleImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
            newImage = possibleImage
        } else if let possibleImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            newImage = possibleImage
        }
        image = newImage
        self.imageView.image = newImage
        picker.dismiss(animated: true)
    }
}
