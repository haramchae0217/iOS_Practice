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
            self.navigationController?.popViewController(animated: true)
        }
    
    @IBAction func addPictureButton(_ sender: UIButton) {
        
    }
    
    
    

}
