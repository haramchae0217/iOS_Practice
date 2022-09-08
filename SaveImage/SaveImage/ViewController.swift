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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureImagePicker()
    }
    
    func configureImagePicker() {
        self.imagePicker.sourceType = .photoLibrary
        self.imagePicker.allowsEditing = true
        self.imagePicker.delegate = self
    }
    
    @IBAction func getImageButtonClicked(_ sender: UIButton) {
        self.present(self.imagePicker, animated: true)
    }
    

    @IBAction func saveImageButtonClicked(_ sender: UIButton) {
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
        
        self.imageView.image = newImage
        picker.dismiss(animated: true)
    }
}
