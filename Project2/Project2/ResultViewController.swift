//
//  ResultViewController.swift
//  Project2
//
//  Created by 유호준 on 2021/08/11.
//

import UIKit

class ResultViewController: UIViewController{
    
    @IBOutlet var resultInterval: UILabel!
    @IBOutlet var resultUpdate: UILabel!
    @IBOutlet var resultEmail: UILabel!

    var paramEmail: String=""
    var paramUpdate: Bool = false
    var paramInterval: Double = 0
    
    @IBAction func back(_ sender: Any) {
        self.presentingViewController?.dismiss(animated: true)
    }
    override func viewDidLoad() {
        self.resultEmail.text = self.paramEmail
        self.resultUpdate.text = (self.paramUpdate == true) ? "자동 갱신" : "자동 갱신 안함"
        self.resultInterval.text = "\(self.paramInterval)분"
    }
}
