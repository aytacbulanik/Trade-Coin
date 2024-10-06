//
//  ViewController.swift
//  Trade Coin
//
//  Created by Aytaç Bulanık on 6.10.2024.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var monetCostLabel: UILabel!
    @IBOutlet weak var moneyNameLabel: UILabel!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var pickerView: UIPickerView!
    
    var testPicker = ["1", "2", "33333333333", "4", "55555", "666", "7", "8", "9999999", "10"]
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerView.delegate = self
        containerView.layer.cornerRadius = 40
    }
    
    
    @IBAction func coinChoseePressed(_ sender: UIButton) {
        
        print(sender.tag)
    }
    

}

extension ViewController : UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        testPicker.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return testPicker[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        monetCostLabel.text = "\(testPicker[row])"
    }
}

