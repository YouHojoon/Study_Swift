//
//  CustomUnwind.swift
//  swiftStudy
//
//  Created by 유호준 on 2021/08/11.
//

import UIKit

class CustomUnwind: UIStoryboardSegue{
    override func perform() {
        let srcUVC = self.source
        let dstUVC = self.destination
        
        UIView.transition(from: srcUVC.view, to: dstUVC.view, duration: 2, options: .transitionCurlUp)
    }
}
