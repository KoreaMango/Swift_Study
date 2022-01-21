//
//  ViewController.swift
//  UpDownGame
//
//  Created by 강민규 on 2020/12/31.
//

import UIKit

class ViewController: UIViewController {

    var randomValue: Int = 0
    var tryCount: Int = 0
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var tryCountLable: UILabel!
    @IBOutlet weak var sliderValueLable: UILabel!
    @IBOutlet weak var minimumValueLable: UILabel!
    @IBOutlet weak var maximumValueLable: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        slider.minimumValue = 0.0
        slider.maximumValue = 30.0
        slider.value = 15.0
        
        slider.setThumbImage(#imageLiteral(resourceName: "slider_thumb"), for: .normal)
        reset()
    }

    @IBAction func sliderValueChanged(_ sender: UISlider){
        print(sender.value)
        let integerValue: Int = Int(sender.value)
        sliderValueLable.text = String(integerValue)
    }
    
    func showAlert(message : String){
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { (action) in
            self.reset()
        }
        
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func touchUpHitButton(_ sender: UIButton){
        print(slider.value)
        let hitValue: Int = Int(slider.value)
        slider.value = Float(hitValue)
        
        tryCount = tryCount + 1
        tryCountLable.text = "\(tryCount) / 5"
        
        if randomValue == hitValue {
            showAlert(message: "YOU HIT!")
            reset()
        }else if tryCount >= 5 {
            showAlert(message: "You Lose..")
            reset()
        }else if randomValue > hitValue {
            slider.minimumValue = Float(hitValue)
            minimumValueLable.text = String(hitValue)
        }else if randomValue < hitValue {
            slider.maximumValue = Float(hitValue)
            maximumValueLable.text = String(hitValue)
        }
        
    }
    
    @IBAction func touchUpResetButton(_ sender: UIButton){
        print("Touch Reset Button")
        reset()
    }
    
    func reset(){
        print("reset!")
        randomValue = Int.random(in: 0...30)
        print(randomValue)
        tryCount = 0
        tryCountLable.text = "0 / 5"
        slider.minimumValue = 0
        slider.maximumValue = 30
        slider.value = 15
        minimumValueLable.text = "0"
        maximumValueLable.text = "30"
        sliderValueLable.text = "15"
        
        
    }
    
    
}

