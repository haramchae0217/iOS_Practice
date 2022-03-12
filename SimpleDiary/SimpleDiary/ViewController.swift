//
//  ViewController.swift
//  SimpleDiary
//
//  Created by Chae_Haram on 2022/03/12.
//

import UIKit

/*
 1. UIImagePickerController 사용
 2. Photos library 사용
 */

class ViewController: UIViewController {

    @IBOutlet weak var diaryImageView: UIImageView!
    @IBOutlet weak var diaryTitleLabel: UILabel!
    @IBOutlet weak var diaryDateLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
  
    }
    
    @IBAction func addButtonClicked(_ sender: UIBarButtonItem) {
        guard let addVC = self.storyboard?.instantiateViewController(withIdentifier: "addVC") as? AddDiaryViewController else { return }
        self.navigationController?.pushViewController(addVC, animated: true)
    }


}

