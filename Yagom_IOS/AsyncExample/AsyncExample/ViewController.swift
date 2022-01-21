//
//  ViewController.swift
//  AsyncExample
//
//  Created by 강민규 on 2022/01/06.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBAction func touchUpDownloadButton(_ sender: UIButton){
        // 이미지 다운로드 -> 이미지 세팅
        // https://pbs.twimg.com/media/FIUbA1xaUAEaK9r?format=jpg&name=medium
        OperationQueue().addOperation {
            guard let imageURL: URL = URL(string: "https://pbs.twimg.com/media/FIUbA1xaUAEaK9r?format=jpg&name=medium")
            else {return}
            do {
                let imageData: Data = try Data.init(contentsOf: imageURL)
                guard let image: UIImage = UIImage(data: imageData)
                    else {return}
                OperationQueue.main.addOperation {
                    self.imageView.image = image
                }
            }
            catch {
                return
            }
        }
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

