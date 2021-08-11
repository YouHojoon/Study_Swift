//
//  TheaterViewController.swift
//  Project5
//
//  Created by 유호준 on 2021/08/11.
//

import UIKit

class TheaterViewController: UITableViewController{
    
    var list = [NSDictionary]()
    var startPoint = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.callTheaterAPI()
    }
    
    func callTheaterAPI(){
        
        let sList = 100
        let type = "json"
        let uri = "http://115.68.183.178:2029/theater/list"
        let url = "\(uri)?s_page=\(self.startPoint)&s_list=\(sList)&type=\(type)"
        
        let urlObjetct = URL(string: url)
        
        do{
          
            //euc-kr 인코딩
            let stringData = try NSString(contentsOf: urlObjetct!, encoding: 0x80_000_422)
            let encdata = stringData.data(using: String.Encoding.utf8.rawValue)
           
            do{
                let apiArray = try JSONSerialization.jsonObject(with: encdata!, options: []) as? NSArray
                
                for obj in apiArray!{
                    self.list.append(obj as! NSDictionary)
                }
            }
            catch{
                let alert = UIAlertController(title: "실패", message: "JSON Serialization 실패", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "확인", style: .cancel))
                
                self.present(alert, animated: false)
            }
            self.startPoint+=sList
        }catch{
            let alert = UIAlertController(title: "실패", message: "JSON Serialization 실패", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "확인", style: .cancel))
        }
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.list.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = self.list[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "tCell") as! TheaterCell
        
        cell.name?.text = row["상영관명"] as? String
        cell.addr?.text = row["소재지도로명주소"] as? String
        cell.tel?.text = row["연락처"] as? String
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segue_map"{
            let path = self.tableView.indexPath(for: sender as! UITableViewCell)
            let data = self.list[path!.row]
            
            (segue.destination as? TheaterMapViewController)?.param = data
        }
    }
}



