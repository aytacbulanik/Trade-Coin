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
    @IBOutlet weak var coinIconImageView: UIImageView!
    @IBOutlet weak var pickerView: UIPickerView!
    
    var coinManager = CoinManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerView.delegate = self
        pickerView.dataSource = self
        containerView.layer.cornerRadius = 40
        moneyNameLabel.text = "AUD"
    }
    
    
    @IBAction func coinChoseePressed(_ sender: UIButton) {
        updateUI(sender.tag)
        //coinManager.choseeCoin(coin: "BTC")
    }
    
    func updateUI(_ tag : Int) {
        switch tag {
        case 0: coinIconImageView.image = UIImage(systemName: "bitcoinsign.circle.fill")
        case 1: coinIconImageView.image = UIImage(named: "etherium")
        case 2: coinIconImageView.image = UIImage(named: "binance")
        case 3: coinIconImageView.image = UIImage(named: "xrp")
        default :  coinIconImageView.image = UIImage(named: "bitcoinsign.circle.fill")
        }
    }
    

}

extension ViewController : UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        coinManager.currencyArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return coinManager.currencyArray[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        moneyNameLabel.text = "\(coinManager.currencyArray[row])"
    }
}

