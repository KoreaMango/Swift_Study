//
//  SecondViewController.swift
//  MyViewTransition
//
//  Created by 강민규 on 2021/12/20.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var nameLable : UILabel!
    @IBOutlet weak var ageLabel : UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.nameLable.text = UserInformation.shared.name
        self.ageLabel.text = UserInformation.shared.age
        print("뷰컨트롤러의 뷰가 화면에 보여질 예정")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("뷰 컨트롤러의 뷰가 화면에 보여짐")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        print("ViewController의 view가 화면에서 사라질 예정")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        print("ViewControoller의 view가 화면에서 사라짐")
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        print("뷰컨트롤러의 뷰가 서브뷰를 레이아웃 하려함")
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        print("뷰컨트롤러의 뷰가 서브뷰를 레이아웃 함")
    }
    @IBAction func popToPrev(){
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func dismissModal(){
        self.dismiss(animated: true, completion: nil)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
