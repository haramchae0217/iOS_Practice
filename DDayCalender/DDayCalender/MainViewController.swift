//
//  ViewController.swift
//  DDayCalender
//
//  Created by Chae_Haram on 2022/03/06.
//

import UIKit

/*
 테이블뷰에 특별한 일정 목록 보여주기 -> 그 일정에는 날짜가 정해져 있고, 오늘로 부터 날짜까지의 D-day 계산해서 출력
 테이블 뷰 셀 : title, d-day
 
 모델
 - 날짜정보
 - 타이틀
 
 디데이 목록화면 / 디데이 추가하기 화면
 + 디데이에 사진 첨부(시간 남으면)
 
 
 */

class MainViewController: UIViewController {

    // UI
    @IBOutlet weak var tableView: UITableView!
    
    // Properties
    let dateFormatter: DateFormatter = {
        let df = DateFormatter()
        df.dateFormat = "yyyy/MM/dd"
        df.locale = Locale(identifier: "ko-KR")
        df.timeZone = TimeZone(abbreviation: "KST")
        return df
    }()
    
    let currentDate = Date()
    let calendar = Calendar.current
    
    // View Life-Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let sortedList = Anniversary.ddayList.sorted { lhs, rhs in
            lhs.targetDate > rhs.targetDate
        }
        
        Anniversary.ddayList = sortedList
        
        tableView.reloadData()
    }
    
    // configure

    // etc
    func calculateDDay(targetDate: Date) -> Int { // 현재(startDate) - 타겟(targetDate)
        // 1. locale값이랑 한국 표준시 적용
        // 2. 시간정보 설정 -> 시작날짜 & 타겟날짜 모두 그 날이 시작하는 0시 0분 0초로 고정
        let start = calendar.startOfDay(for: currentDate)
        let end = calendar.startOfDay(for: targetDate)
        
        // 1. 현재 날짜 정보 (위에서 선언)
        // 2. 타겟 날짜 정보
        let dayCount = calendar.dateComponents([.day], from: start, to: end).value(for: .day)!
        
        // let dayCount = calendar.dateComponents([.day], from: currentDate, to: targetDate).day! + 1
        // 3. 문자열로는 불가, Date 정보 간의 연산 -> Int (며칠인지) 리턴
        return dayCount
    }
    
    // action
    @IBAction func addButtonClicked(_ sender: UIBarButtonItem) {
        // 1. 어떤 화면인지 선언
        guard let addVC = self.storyboard?.instantiateViewController(withIdentifier: "addVC") as? AddViewController else { return }
        // 2. 기타 넘겨줄 데이터가 있으면 넘겨주기
        addVC.title = "D-Day 추가하기"
        // 3. push
        self.navigationController?.pushViewController(addVC, animated: true)
    }
    
}

// extension

extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Anniversary.ddayList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MainTableViewCell.identifier, for: indexPath) as? MainTableViewCell else { return UITableViewCell() }
        let dday = Anniversary.ddayList[indexPath.row]
        cell.titleLabel.text = dday.title
        
        let days = calculateDDay(targetDate: dday.targetDate)
        // days가 양수이면 -를 붙여주고, 음수이면 양수로 바꾸고 +를 붙이기
        
        if days > 0 {
            cell.ddayLabel.text = "D-\(days)"
        } else if days == 0 {
            cell.ddayLabel.text = "D-Day"
            cell.ddayLabel.textColor = .red
        } else {
            cell.ddayLabel.text = "D+\(-days)"
            cell.ddayLabel.textColor = .lightGray
        }
        
        // print(dday.title, dday.targetDate)
        
        return cell
    }
}

extension MainViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let editVC = self.storyboard?.instantiateViewController(withIdentifier: "addVC") as? AddViewController else { return }
        editVC.title = "D-Day 수정하기"
    
        let dday = Anniversary.ddayList[indexPath.row]
        editVC.dday = dday
        editVC.row = indexPath.row
        // 1. date정보
        // editVC.datePicker.date = dday.targetDate
        // 2. title 정보
        // editVC.titleTextField.text = dday.title
        self.navigationController?.pushViewController(editVC, animated: true)
        
    }
}

