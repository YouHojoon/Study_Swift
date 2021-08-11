//
//  ImageViewController.swift
//  Project4
//
//  Created by 유호준 on 2021/08/11.
//

import UIKit

class ImageViewController: UIViewController, UIImagePickerControllerDelegate,
                           UINavigationControllerDelegate{
    @IBOutlet var imgView: UIImageView!
    
    @IBAction func pick(_ sender: Any) {
        let picker = UIImagePickerController()
        picker.sourceType = .photoLibrary
        picker.allowsEditing = true
        picker.delegate = self
        self.present(picker, animated: false)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: false)//picker에서 내부적으로 picker.presentingViewController?.dismiss를 호출
        
        let alert = UIAlertController(title: "", message:"이미지 선택이 취소되었습니다.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "확인", style: .cancel))
        self.present(alert, animated:false)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: false){() in
            let img = info[UIImagePickerController.InfoKey.editedImage] as? UIImage
            self.imgView.image = img
        }
    }
    
}
