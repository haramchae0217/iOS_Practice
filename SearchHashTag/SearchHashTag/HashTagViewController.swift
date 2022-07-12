//
//  ViewController.swift
//  SearchHashTag
//
//  Created by Chae_Haram on 2022/07/12.
//

import UIKit

class HashTagViewController: UIViewController {

    @IBOutlet weak var hashTagTextField: UITextField!
    @IBOutlet weak var hashTagListLabel: UILabel!
    
    var dataList: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    @IBAction func addHashTagButton(_ sender: UIButton) {
        if let hashTag = hashTagTextField.text, !hashTag.isEmpty {
            dataList.append(hashTag)
            hashTagTextField.text = ""
            
            var hashTagStr: String = ""
            
            for i in 0..<dataList.count {
                if i == dataList.count - 1 {
                    hashTagStr.append("#\(dataList[i])")
                    break
                }
                hashTagStr.append("#\(dataList[i]), ")
            }
            
//            for data in dataList {
//                hashTagStr.append("#\(data), ")
//            }
//
//            hashTagStr.removeLast()
//            hashTagStr.removeLast()
            
            hashTagListLabel.text = "\(hashTagStr)"
        } else {
            // "해시태그를 입력하세요" 라는 얼럿 띄우기
            let alert = UIAlertController(title: "알림", message: "해시태그를 입력하세요", preferredStyle: .alert)
            let check = UIAlertAction(title: "확인", style: .default)
            alert.addAction(check)
            self.present(alert, animated: true)
        }
        
        
    }
    
    @IBAction func searchHashTagButton(_ sender: UIBarButtonItem) {
        guard let searchVC = storyboard?.instantiateViewController(withIdentifier: "SearchVC") as? SearchViewController else { return }
        searchVC.hashTagList = dataList
        navigationController?.pushViewController(searchVC, animated: true)
    }
}

// guard let문 : casting한 결과가 nil이 아니면 searchVC라는 상수에 담아주고 이하의 코드를 실행한다.
//          casting한 결과가 nil이면 else 구문을 실행하여 return 되어 해당 함수의 코드 블록을 종료한다.
// if let문    : = 뒤에 오는 값이 nil이 아니면 상수에 담아주고 if문의 코드를 실행하고, nil이면 else문을 실행.
