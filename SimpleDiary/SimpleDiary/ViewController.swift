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
        diaryImageView.contentMode = .scaleAspectFill
  
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if Diary.diaryData.content.isEmpty {
            diaryTitleLabel.text = "내용없음"
        } else {
            diaryTitleLabel.text = Diary.diaryData.content
        }
        diaryDateLabel.text = "\(Diary.diaryData.date)"
        diaryImageView.image = Diary.diaryData.picture
        
        
    }
    
    @IBAction func addButtonClicked(_ sender: UIBarButtonItem) {
        guard let addVC = self.storyboard?.instantiateViewController(withIdentifier: "addVC") as? AddDiaryViewController else { return }
        self.navigationController?.pushViewController(addVC, animated: true)
    }


}

