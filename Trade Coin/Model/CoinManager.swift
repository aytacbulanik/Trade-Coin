//
//  CoinManager.swift
//  Trade Coin
//
//  Created by Aytaç Bulanık on 6.10.2024.
//

import Foundation

struct CoinManager {
    
    
    let baseURL = "https://rest.coinapi.io/v1/exchangerate/"
    let apiKey = "apikey=471526db-f78c-43ba-bc8a-1f6dd6a7a448&invert=true"
    
    func choseeCoin(coin : String) {
        let urlString = "\(baseURL)\(coin)?\(apiKey)"
    }
    
    
    func FetchCoinData() {
        
    }
}
