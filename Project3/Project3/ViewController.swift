//
//  ViewController.swift
//  Project3
//
//  Created by 유호준 on 2021/08/11.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var result: UILabel!
    @IBAction func login(_ sender: Any) {
        let title = "iTunes Store에 로그인"
        let message = "사용자의 Apple ID의 암호를 입력하십시오"
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        alert.addTextField(){(tf) in
            tf.placeholder = "암호"
            tf.isSecureTextEntry = true
        }
        
        let cancel = UIAlertAction(title: "취소", style: .cancel)
        let ok = UIAlertAction(title: "확인", style: .default){_ in
            if let tf = alert.textFields?[0]{
                print("입력된 값은 \(tf.text!)입니다")
            }
            else{
                print("확인 버튼을 클릭했습니다.")
            }
        }
        
        alert.addAction(cancel)
        alert.addAction(ok)
        
        self.present(alert, animated:false)
    }
    @IBAction func alert(_ sender: Any) {
        
        let alert = UIAlertController(title: "선택", message: "항목을 선택해주세요.", preferredStyle: .alert)
        
        let cancel = UIAlertAction(title: "취소", style: .cancel)
        let ok = UIAlertAction(title: "확인", style: .default){
            _ in self.result.text = "확인 버튼을 클릭했습니다."
        }
        
        let exec = UIAlertAction(title: "실행", style: .destructive){
            _ in self.result.text = "실행 버튼을 클릭했습니다."
        }
        let stop = UIAlertAction(title: "중지", style: .default){
            _ in self.result.text = "중지 버튼을 클릭했습니다."
        }
        
        alert.addAction(cancel)
        alert.addAction(ok)
        alert.addAction(exec)
        alert.addAction(stop)
        
        self.present(alert, animated: false)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

