//
//  ViewController.swift
//  Alarm
//
//  Created by 유호준 on 2021/08/11.
//

import UIKit
import UserNotifications

class ViewController: UIViewController {

    @IBOutlet var msg: UITextField!
    @IBOutlet var datepicker: UIDatePicker!
    
    @IBAction func save(_ sender: Any) {
        
        
        UNUserNotificationCenter.current().getNotificationSettings{settings in
            if settings.authorizationStatus == .authorized{
                DispatchQueue.main.async {
                    
                    let nContent = UNMutableNotificationContent()
                    nContent.body = self.msg.text!
                    nContent.title = "미리 알림"
                    nContent.sound = UNNotificationSound.default

                    let time = self.datepicker.date.timeIntervalSinceNow
                    print(time)
                    let trigger = UNTimeIntervalNotificationTrigger(timeInterval: time, repeats: false)

                    let request = UNNotificationRequest(identifier: "alarm", content: nContent, trigger: trigger)
                    print(time)
                    UNUserNotificationCenter.current().add(request)
                }
                
            }
            else{
                let alert = UIAlertController(title: "알림 등록", message: "알림이 허용되어 있지 않습니다.", preferredStyle: .alert)
                
                let ok = UIAlertAction(title: "확인", style: .default)
                
                alert.addAction(ok)
                self.present(alert, animated: false)
                
                return
            }
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

