//
//  ViewController.swift
//  MyDatePicker
//
//  Created by 강민규 on 2021/12/22.
//

import UIKit

class ViewController: UIViewController {
    
    let dateFormatter: DateFormatter = {
        let formatter: DateFormatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd hh:mm:ss"
        return formatter
    }()
    
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBAction func didDatePickerValueChanged(_ sender: UIDatePicker ){
        print("value change")
        
        let date: Date = self.datePicker.date
        // sender.date 도 가능
        let dateString: String = self.dateFormatter.string(from: date)
        
        self.dateLabel.text = dateString
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.datePicker.addTarget(self, action: #selector(self.didDatePickerValueChanged(_:)), for: UIControl.Event.valueChanged)
    }


}

