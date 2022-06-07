//
//  ViewController.swift
//  tableViewSection
//
//  Created by Chae_Haram on 2022/01/25.
//

import UIKit

class ViewController: UIViewController {

    // MARK: UI
    @IBOutlet weak var tableView: UITableView! // tableView와 연동 후 설정 가능
    
    // MARK: Proterties
    var sections: [String] = ["섹션1","섹션2","섹션3"]
    var datas: [String] = ["로우1","로우2","로우3","로우4","로우5"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self //
        tableView.dataSource = self //
        
    }

}

// MARK: extension
extension ViewController: UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sections[section]
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? DataTableViewCell else { return UITableViewCell() }
        cell.contentLabel.text = datas[indexPath.row]
        
        
        
        
        return cell
    }
}

extension ViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath)
        guard let detailVC = self.storyboard?.instantiateViewController(withIdentifier: "detailVC") as? DetailViewController else { return }
        // cell을 눌렀을 때 detailVC로 회면전환
        // detailVC에 있는 contentlabel에 적힌 text를 detailVC의 contentTextField에 넘겨줄것
        detailVC.content = datas[indexPath.row]
        detailVC.row = indexPath.row
        //detailVC.section = indexPath.section
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
}
