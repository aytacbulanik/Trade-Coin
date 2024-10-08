//
//  CoinManager.swift
//  Trade Coin
//
//  Created by Aytaç Bulanık on 6.10.2024.
//

import Foundation

protocol CoinManagerProtocol {
    func sendCoinModel(_ model : CoinModel)
    func sendError(_ error : Error)
}

struct CoinManager {
    
    var delegate : CoinManagerProtocol?
    let baseURL = "https://rest.coinapi.io/v1/exchangerate/"
    let apiKey = "apikey=471526db-f78c-43ba-bc8a-1f6dd6a7a448&invert=true"
    
    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]
    
    func choseeCoin(coin : String , money : String) {
        let urlString = "\(baseURL)\(coin)/\(money)?\(apiKey)"
        fetchCoinData(urlString)
    }
    
    
    func fetchCoinData(_ urlString : String) {
        guard let url = URL(string: urlString) else { return }
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url) { data, response , error in
            
            if let error {
                delegate?.sendError(error)
                return
            }
            
            guard let data else { return }
            guard let  coinData = self.decoderJSON(data) else { return }
            delegate?.sendCoinModel(coinData)
        }
        task.resume()
    }
    
    func decoderJSON(_ data : Data) -> CoinModel? {
        let decoder = JSONDecoder()
        do {
            let coinData = try decoder.decode(CoinModel.self, from: data)
            return coinData
        } catch {
            delegate?.sendError(error)
            return nil
        }
    }
}
