//
//  ViewController.swift
//  tableViewPractice
//
//  Created by Chae_Haram on 2022/01/18.
//

import UIKit

class ViewController: UIViewController{

    //UI
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "제목"

        
    }
    
    //Action
    @IBAction func button(_ sender: UIButton) {
        // 1. 목적지 선언
        guard let secondVC = self.storyboard?.instantiateViewController(withIdentifier: "secondVC") else { return }

        // 도착지에 대한 초기화 : 데이터나 설정 작성
        //secondVC.modalPresentationStyle = .fullScreen
        
        // 2. push, present 선언
        
        // 2.1 present - dismiss
        //self.present(secondVC, animated: true, completion: nil)
        
        // 2.2 push - pop
        self.navigationController?.pushViewController(secondVC, animated: true)
    }
    
    


}

