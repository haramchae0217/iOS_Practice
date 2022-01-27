//
//  ViewController.swift
//  MemoPractice
//
//  Created by Chae_Haram on 2022/01/27.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var memoTableView: UITableView!
    
    var memoTitle: [String] = ["0000","1111"]
    var memoDate: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        memoTableView.dataSource = self // memotableview의 데이터 소스 -> 데이터 변화 감지
        memoTableView.delegate = self   // memotableview의 델리게이트 -> 화면 액션 변화 감지
    }


}
extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return memoTitle.count
        // 데이터 부분, 셀을 몇개를 생성할지 결정함. 보통 유동적으로 사용하기 때문에 제일 주체가 될 수 있는 변수의 갯수로 하는경우가 많다.
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "memoTableCell", for: indexPath) as? MainTableViewCell else { return UITableViewCell() }
        cell.memoTitleLabel.text = memoTitle[indexPath.row]
        cell.memoDateLabel.text = memoDate[indexPath.row]
        return cell
        // Reuseidentifier로 구분해 재사용 가능한 maintableviewcell 객체를 리턴하고 그 리턴값을 테이블에 추가하는 역할 리턴값이 없다면 uitableviewcell 자체를 리턴해 아무일도 안일어나게 함

    }
    
    
}

extension ViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
        // 화면 셀의 크기를 90으로 고정하는 함수
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let memoVC = self.storyboard?.instantiateViewController(withIdentifier: "memoVC") as? MemoViewController else { return }
        memoVC.memo = memoTitle[indexPath.row]
        memoVC.row = indexPath.row
        self.navigationController?.pushViewController(memoVC, animated: true)
        //
    }
}
