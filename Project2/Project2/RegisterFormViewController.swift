//
//  RegisterFormViewController.swift
//  Project2
//
//  Created by 유호준 on 2021/08/11.
//

import UIKit

class RegisterFormViewController: UIViewController{
    
    @IBOutlet var email: UITextField!
    @IBOutlet var isUpdate: UISwitch!
    @IBOutlet var interval: UIStepper!
    
    @IBAction func onSubmit(_ sender: Any) {
        
        /*
            값을 뷰 컨트롤러로 직접 전달
         */
//        let preVC = self.presentingViewController
//
//        guard let vc = preVC as? RegistResultViewController else {
//            return
//        }
//
//        vc.paramEmail = self.email.text
//        vc.paramUpdate = self.isUpdate.isOn
//        vc.paramInterval = self.interval.value
//
//        vc.dismiss(animated: true)
        
        /*
            AppDelegate로 전달
         */
        
//        let ad = UIApplication.shared.delegate as? AppDelegate
//        ad?.paramEmail = self.email.text
//        ad?.paramUpdate = self.isUpdate.isOn
//        ad?.paramInterval = self.interval.value
//
        /*
            UserDefaults 객체로 전달
         */
        let ud = UserDefaults.standard
        
        ud.set(self.email.text, forKey: "email")
        ud.set(self.isUpdate.isOn,forKey: "isUpdate")
        ud.set(self.interval.value,forKey: "interval")
        
        self.presentingViewController?.dismiss(animated: true)
    }
    
}
