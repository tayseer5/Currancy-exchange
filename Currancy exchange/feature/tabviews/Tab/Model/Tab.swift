//
//  Tab.swift
//  Currancy exchange
//
//  Created by Tayseer-Anwar on 13/10/2024.
//

import Foundation


enum Tab : String{
    case Home
    case Trade
    case Market
    case Favourite
    case Wallet
    public var iconImage: String {
        switch self{
        case .Home:
            return "home"
        case .Trade:
            return "trade"
        case .Market:
            return "market"
        case .Favourite:
            return "favourite"
        case .Wallet:
            return "wallet"
        }
    }
}
