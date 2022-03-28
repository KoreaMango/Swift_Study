//
//  OrderConfirmationViewController.swift
//  Restaurant
//
//  Created by 강민규 on 2022/03/28.
//

import UIKit

class OrderConfirmationViewController: UIViewController {

    @IBOutlet weak var timeRemainingLabel: UILabel!

    var minutes: Int!
    override func viewDidLoad() {
        super.viewDidLoad()
        timeRemainingLabel.text = "Thanx, wait time is \(minutes!) minutes"
        // Do any additional setup after loading the view.
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
