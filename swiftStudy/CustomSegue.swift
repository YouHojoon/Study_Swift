//
//  CustomSegue.swift
//  swiftStudy
//
//  Created by 유호준 on 2021/08/11.
//

import UIKit

class CustomSegue: UIStoryboardSegue{
    override func perform() {
        let srcUVC = self.source
        let destUVC = self.destination
        
        UIView.transition(from: srcUVC.view, to: destUVC.view, duration: 2, options: .transitionCurlDown)
    }
   
    
}
