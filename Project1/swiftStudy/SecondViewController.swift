//
//  SecondViewController.swift
//  swiftStudy
//
//  Created by 유호준 on 2021/08/11.
//

import UIKit
class SecondViewController:ViewController{
    
    @IBAction func back(_ sender: Any) {
        self.presentingViewController?.dismiss(animated: true)
    }
    
    @IBAction func back2(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func unwindToView3(_ unwindSegue: UIStoryboardSegue) {
        
    }
    
    
}
