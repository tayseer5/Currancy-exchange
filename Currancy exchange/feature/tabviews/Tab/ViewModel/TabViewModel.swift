//
//  TabViewModel.swift
//  Currancy exchange
//
//  Created by Tayseer-Anwar on 13/10/2024.
//

import Foundation


class TabViewModel: ObservableObject { // Generic struct 'StateObject' requires that 'TabViewModel' conform to 'ObservableObject'
    @Published var currentView: Tab = .Home
    let tabs: [Tab] = [.Home, .Trade, .Market, .Favourite, .Wallet]
    
    
}
