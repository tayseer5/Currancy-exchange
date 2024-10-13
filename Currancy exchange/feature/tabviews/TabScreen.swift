//
//  TabScreen.swift
//  Currancy exchange
//
//  Created by Tayseer-Anwar on 10/10/2024.
//

import SwiftUI


// what is different navigationViewStyle
struct TabScreen: View {
    @State private var currentView: Tab = .Home
    @State private var showModal: Bool = false
    
    var body: some View {
        NavigationView {
            VStack {
                CurrentScreen(currentView: self.$currentView)
                TabBar(currentView: self.$currentView)
            }
            .edgesIgnoringSafeArea(.all)
        }
        .background(Color(.white))
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct TabBar: View {
    @Binding var currentView: Tab
    
    let tabs: [Tab] = [.Home, .Trade, .Market, .Favourite, .Wallet]

    var body: some View {
        HStack {
            ForEach(tabs, id: \.self) { tab in
                TabBarItem(currentView: self.$currentView, tab: tab)
            }
        }
        .frame(maxWidth: .infinity, minHeight: 70)
        .padding(.all)
    }
}

struct TabBarItem: View {
    @Binding var currentView: Tab
    var tab: Tab
    
    var body: some View {
        Button(action: {
            currentView = tab
        }) {
            VStack {
                Image(tab.iconImage)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 25, height: 25)
                    .foregroundColor(currentView == tab ? .blue : .gray)
                Text(tab.rawValue.capitalized)
                    .font(.system(size: 10))
                    .foregroundColor(currentView == tab ? .blue : .gray)
                    .lineLimit(1)
                    .multilineTextAlignment(.center)
            }
        }
        .padding()
        .accessibilityLabel(tab.rawValue.capitalized)
    }
}

struct CurrentScreen: View {
    @Binding var currentView: Tab
    
    var body: some View {
        VStack {
            switch self.currentView  {
            case .Home:
                HomeScreen()
            case .Trade:
                HomeScreen()
            case .Market:
                HomeScreen()
            case .Favourite:
                HomeScreen()
            case .Wallet:
                HomeScreen()
            }
        }
    }
}

#Preview {
    TabScreen()
}

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

