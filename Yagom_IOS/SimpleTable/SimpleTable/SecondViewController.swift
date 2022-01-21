//
//  SecondViewController.swift
//  SimpleTable
//
//  Created by 강민규 on 2021/12/28.
//

import UIKit

class SecondViewController: UIViewController {

    var textToset: String?
    @IBOutlet weak var textLabel : UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
        self.textLabel.text = self.textToset
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
