//
//  ViewController.swift
//  ImageAddPractice
//
//  Created by Chae_Haram on 2022/03/16.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var pictureImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    // UI 선언
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pictureImageView.contentMode = .scaleAspectFill
        // imageView 사이즈 설정
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        pictureImageView.image = Photo.photoData.picture
        titleLabel.text = Photo.photoData.title
        // 모델에 저장한 값을 현재 VC에 있는 UI에 대입
    }
    @IBAction func addBarButtonItem(_ sender: UIBarButtonItem) {
        guard let addVC = self.storyboard?.instantiateViewController(withIdentifier: "addVC") as? AddVCViewController else { return }
            self.navigationController?.pushViewController(addVC, animated: true)
        // 화면 전환
    }
    

}

