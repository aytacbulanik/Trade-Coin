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
        fetchCoinData(urlString)
    }
    
    
    func fetchCoinData(_ urlString : String) {
        guard let url = URL(string: urlString) else { return }
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url) { data, response , error in
            
            if let error {
                print(error.localizedDescription)
                return
            }
            
            guard let data else { return }
            guard let  coinData = self.decoderJSON(data) else { return }
            print(coinData)
        }
        task.resume()
    }
    
    func decoderJSON(_ data : Data) -> CoinModel? {
        let decoder = JSONDecoder()
        do {
            let coinData = try decoder.decode(CoinModel.self, from: data)
            return coinData
        } catch {
            print(error.localizedDescription)
            return nil
        }
    }
}
