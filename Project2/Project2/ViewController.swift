//
//  ViewController.swift
//  Project2
//
//  Created by 유호준 on 2021/08/11.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var email: UITextField!
    @IBOutlet var isUpdate: UISwitch!
    @IBOutlet var interval: UIStepper!
    @IBOutlet var isUpdateText: UILabel!
    @IBOutlet var intervalText: UILabel!
    

    @IBAction func onSwitch(_ sender: UISwitch) {
        if (sender.isOn){
            self.isUpdateText.text = "갱신함"
        }
        else{
            self.isUpdateText.text="갱신하지 않음"
        }
    }
    
    @IBAction func onStepper(_ sender: UIStepper) {
        let value = sender.value
        self.intervalText.text = "\(value)분"
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let rvc = segue.destination as? ResultViewController{
            rvc.paramEmail = self.email.text!
            rvc.paramUpdate = self.isUpdate.isOn
            rvc.paramInterval = self.interval.value
        }
        
    }
    @IBAction func onManualSubmit(_ sender: Any) {
        self.performSegue(withIdentifier: "ManualSubmit", sender: self)
    }
    
    @IBAction func onNaviSubmit(_ sender: Any) {
        guard let rvc=self.storyboard?.instantiateViewController(withIdentifier: "RVC") as? ResultViewController else {
            return
        }
        rvc.paramEmail = self.email.text!
        rvc.paramUpdate = self.isUpdate.isOn
        rvc.paramInterval = self.interval.value
        
        rvc.modalTransitionStyle =
            UIModalTransitionStyle.flipHorizontal
        rvc.modalPresentationStyle =
            UIModalPresentationStyle.fullScreen
        
        self.navigationController?.pushViewController(rvc, animated: true)
    }
    @IBAction func onSubmit(_ sender: Any) {
        guard let rvc=self.storyboard?.instantiateViewController(withIdentifier: "RVC") as? ResultViewController else {
            return
        }
        rvc.paramEmail = self.email.text!
        rvc.paramUpdate = self.isUpdate.isOn
        rvc.paramInterval = self.interval.value
        
        rvc.modalTransitionStyle =
            UIModalTransitionStyle.flipHorizontal
        rvc.modalPresentationStyle =
            UIModalPresentationStyle.fullScreen
        
        self.present(rvc, animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

