//
//  ViewController.swift
//  TapGesture
//
//  Created by 강민규 on 2021/12/22.
//

import UIKit

class ViewController: UIViewController, UIGestureRecognizerDelegate{
    
//    @IBAction func tapView(_ sender: UITapGestureRecognizer){
//        self.view.endEditing(true)
//    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
//        방법 1: 스토리보드에서 하기
//        방법 2: IBAction 이랑 TapGestureRecognizer 써서, self.view에서 IBAction 불러오기
//        let tapGesture: UITapGestureRecognizer =
//        UITapGestureRecognizer(target: self, action: #selector(self.tapView(_:)))
//
//        self.view.addGestureRecognizer(tapGesture)
        
        // 방법 3: Recognizer 사용하기 (정교한 방법)
        let tapGesture: UITapGestureRecognizer = UITapGestureRecognizer()
        tapGesture.delegate = self
        
        self.view.addGestureRecognizer(tapGesture)
        
    }
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool{
        self.view.endEditing(true)
        return true
    }


}

