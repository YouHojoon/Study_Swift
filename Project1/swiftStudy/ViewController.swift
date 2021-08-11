//
//  ViewController.swift
//  swiftStudy
//
//  Created by 유호준 on 2021/08/11.
//

import UIKit

class ViewController: UIViewController {

   
    @IBOutlet var uiTitle01: UILabel!
    @IBOutlet var uiTitle02: UILabel!
    @IBOutlet var uiTitle03: UILabel!
    @IBOutlet var uiTitle04: UILabel!
    @IBOutlet var uiTitle05: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func unwind(_ segue: UIStoryboardSegue){
        
    }
    @IBAction func unwindToTitle(_ unwindSegue: UIStoryboardSegue) {
        let sourceViewController = unwindSegue.source
        
        print(sourceViewController)
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //NSLog("\(segue.identifier!)")
    }
    
    @IBAction func moveByNavi(_ sender: Any) {
        guard let uvc = self.storyboard?.instantiateViewController(withIdentifier: "SecondVC") else {
            return
        }
        
        self.navigationController?.pushViewController(uvc, animated: true)
    }
    @IBAction func wind(_ sender: Any) {
        self.performSegue(withIdentifier: "ManualWind", sender: self)
    }
    @IBAction func clickBtn01(_ sender: Any) {
        guard let uvc = self.storyboard?.instantiateViewController(withIdentifier: "SecondVC") else{
            return
        }
        
        uvc.modalPresentationStyle = UIModalPresentationStyle.fullScreen
        
        uvc.modalTransitionStyle = UIModalTransitionStyle.coverVertical
        
        self.present(uvc, animated: true)
    }
    @IBAction func clickBtn02(_ sender: Any) {
        self.uiTitle02.text = "Button02 Cliked"
    }
    @IBAction func clickBtn03(_ sender: Any){
        self.uiTitle03.text = "Button03 Cliked"
    }
    @IBAction func clickBtn04(_ sender: Any){
        self.uiTitle04.text = "Button04 Cliked"
    }
    @IBAction func clickBtn05(_ sender: Any) {
        self.uiTitle05.text = "Button05 Cliked"
    }
    
}

