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
    var coinName : String = ""
    var coins = ["BTC","ETH","BNB","XRP"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerView.delegate = self
        pickerView.dataSource = self
        coinManager.delegate = self
        containerView.layer.cornerRadius = 40
        moneyNameLabel.text = "AUD"
    }
    
    
    @IBAction func coinChoseePressed(_ sender: UIButton) {
        updateUI(sender.tag)
        
    }
    
    func updateUI(_ tag : Int) {
        switch tag {
        case 0:
            coinIconImageView.image = UIImage(systemName: "bitcoinsign.circle.fill")
            coinName = coins[0]
        case 1: coinIconImageView.image = UIImage(named: "etherium")
            coinName = coins[1]
        case 2: coinIconImageView.image = UIImage(named: "binance")
            coinName = coins[2]
        case 3: coinIconImageView.image = UIImage(named: "xrp")
            coinName = coins[3]
        default :  coinIconImageView.image = UIImage(named: "bitcoinsign.circle.fill")
            coinName = coins[0]
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
        let currentMoneyCost = coinManager.currencyArray[row]
        coinManager.choseeCoin(coin: coinName, money: currentMoneyCost)
        moneyNameLabel.text = "\(currentMoneyCost)"
    }
}

extension ViewController : CoinManagerProtocol {
    func sendCoinModel(_ model: CoinModel) {
        print(model.rate)
    }
    
    func sendError(_ error: any Error) {
        print(error)
    }
    
    
}

