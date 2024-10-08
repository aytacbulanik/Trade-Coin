//
//  CoinModel.swift
//  Trade Coin
//
//  Created by Aytaç Bulanık on 6.10.2024.
//

import Foundation

struct CoinModel : Codable {
    let asset_id_base : String
    let asset_id_quote : String
    let rate : Double
}

