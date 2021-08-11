//
//  ViewController.swift
//  Project6
//
//  Created by 유호준 on 2021/08/11.
//

import UIKit

class ViewController: UITableViewController {
    
    var list = [String]()
    
    @IBAction func add(_ sender: Any) {
        let alert = UIAlertController(title: "목록 입력", message: "추가될 글을 작성하세요.", preferredStyle: .alert)
        
        alert.addTextField(){tf in
            tf.placeholder = "내용을 입력하세요."
        }
        
        let ok = UIAlertAction(title: "OK", style: .default){(_) in
            if let title=alert.textFields?[0].text{
                self.list.append(title)
                self.tableView.reloadData()
            }
        }
        alert.addAction(ok)
        alert.addAction(UIAlertAction(title: "취소", style: .cancel))
        
        self.present(alert, animated: false)
        
    }
//    //높이 수동조절
//    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        let row = self.list[indexPath.row]
//        let height = CGFloat(60+(row.count/30)*20)
//        
//        return height
//    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.list.count
    }
    override func viewWillAppear(_ animated: Bool) {
        self.tableView.estimatedRowHeight = 50//임시 높이값
        self.tableView.rowHeight = UITableView.automaticDimension
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = self.list[indexPath.row]
        //cell identifier를 가진 셀을 읽어온다. 없다면 생성한다.
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") ?? UITableViewCell()
        
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = row
        return cell
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

