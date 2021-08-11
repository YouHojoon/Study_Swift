//
//  DetailViewController.swift
//  Project5
//
//  Created by 유호준 on 2021/08/11.
//

import UIKit
import WebKit

class DetailViewController: UIViewController{
    @IBOutlet var spinner: UIActivityIndicatorView!
    @IBOutlet var wv: WKWebView!
    var mvo: MovieVO!
    
    override func viewDidLoad() {
        self.navigationItem.title = self.mvo.title
        self.wv.navigationDelegate = self
        self.wv.uiDelegate = self
        
        if let url = self.mvo.detail{
            if let urlObject = URL(string: url){
                let req = URLRequest(url: urlObject)
                self.wv.load(req)
            }
            else{
                let alert = UIAlertController(title: "오류", message: "잘못된 URL입니다.", preferredStyle: .alert)
                let cancelAction = UIAlertAction(title:"확인",style: .cancel){(_) in
                    _ = self.navigationController?.popViewController(animated: true)
                }
                alert.addAction(cancelAction)
                self.present(alert, animated: false)
            }
        }
        else{
            let alert = UIAlertController(title: "오류", message: "상세 정보 URL 누락", preferredStyle: .alert)
            let cancelAction = UIAlertAction(title: "확인", style: .cancel){(_) in
                _ = self.navigationController?.popViewController(animated: true)
            }
            
            alert.addAction(cancelAction)
            self.present(alert, animated: true)
        }
        
    }
}

extension DetailViewController: WKNavigationDelegate{
    
    //접근 제어, 웹의 접근을 막을 수 있다
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        
        guard let url = navigationAction.request.url?.absoluteString else{
            return
        }
        print("url:\(url)")
//        if(url.starts(with: "http:")){
//            decisionHandler(.cancel)
//        }
        decisionHandler(.allow)
    }
    // 로딩을 시작할 때
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        self.spinner.startAnimating()
    }
    // 로딩이 완전히 끝났을 때
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        self.spinner.stopAnimating()
    }
    // 로딩에 실패했을 때
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        self.spinner.stopAnimating()
        
        
        alert("상세 페이지를 읽어오지 못했습니다."){() in
            _ = self.navigationController?.popViewController(animated: true)}
    }
}

extension DetailViewController: WKUIDelegate{
    
}

extension DetailViewController{
    func alert(_ message:String, onClick: (()->Void)? = nil){
        
        let controller = UIAlertController(title: "오류", message: message, preferredStyle: .alert)
        controller.addAction(UIAlertAction(title: "OK", style: .cancel){(_) in
            onClick?()
        })
        
        DispatchQueue.main.async {
            self.present(controller, animated: false)
        }
    }
}
