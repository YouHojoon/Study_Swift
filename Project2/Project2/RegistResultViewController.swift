//
//  RegistResultViewController.swift
//  Project2
//
//  Created by 유호준 on 2021/08/11.
//

import UIKit

class RegistResultViewController: UIViewController{
    @IBOutlet var resultEmail: UILabel!
    @IBOutlet var resultUpdate: UILabel!
    @IBOutlet var resultInterval: UILabel!
    
    var paramEmail:String?
    var paramUpdate:Bool?
    var paramInterval:Double?
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        /*
            뷰 컨트롤러로 전달 받기
         */
//        if let email = self.paramEmail{
//            self.resultEmail.text = email
//        }
//
//        if let update = self.paramUpdate{
//            self.resultUpdate.text = (update == true) ? "자동 갱신" : "자동 갱신 안함"
//        }
//
//        if let interval = self.paramInterval {
//            self.resultInterval.text = "\(interval)분"
//        }
            
        /*
            AppDelgate로 전달 받기
         */
//        let ad = UIApplication.shared.delegate as? AppDelegate
//
//        if let email = ad?.paramEmail{
//            self.resultEmail.text = email
//        }
//
//        if let update = ad?.paramUpdate{
//            self.resultUpdate.text = (update == true) ? "자동 갱신" : "자동 갱신 안함"
//        }
//
//        if let interval = ad?.paramInterval {
//            self.resultInterval.text = "\(interval)분"
//        }
        /*
            UserDefaults객체로 전달 받기
         */
        
        let ud = UserDefaults.standard
        
        if let email = ud.string(forKey: "email"){
            self.resultEmail.text = email
        }
        
        let update = ud.bool(forKey: "isUpdate")
        self.resultUpdate.text = (update == true) ? "자동 갱신" : "자동 갱신 안함"
        
        
        let interval = ud.double(forKey: "interval")
        self.resultInterval.text = "\(interval)분"
        
        
    }
    
}
