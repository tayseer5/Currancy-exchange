//
//  TabScreen.swift
//  Currancy exchange
//
//  Created by Tayseer-Anwar on 10/10/2024.
//

import SwiftUI


// what is different navigationViewStyle
//StateObject , ObservedObject, Published, Binding
struct TabScreen: View {
    @StateObject var viewModel = TabViewModel()
    @State private var showModal: Bool = false
    
    var body: some View {
        NavigationView {
            VStack {
                CurrentScreen(currentView: $viewModel.currentView)
                TabBar(viewModel: viewModel)
            }
            .edgesIgnoringSafeArea(.all)
        }
        .background(Color(.white))
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct TabBar: View {
    @ObservedObject var viewModel: TabViewModel
    var body: some View {
        HStack {
            ForEach(viewModel.tabs, id: \.self) { tab in
                TabBarItem(currentView: $viewModel.currentView, tab: tab)
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
                TabBarItemIcon(currentView: $currentView, tab: tab)
                TabBarItemTitle(currentView: $currentView, tab: tab)
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
                TradeView()
            case .Market:
                MarketView()
            case .Favourite:
                FavouriteView()
            case .Wallet:
                WalletView()
            }
        }
    }
}

struct TabBarItemIcon: View {
    @Binding var currentView: Tab
    var tab: Tab
    var body: some View {
        Image(tab.iconImage)
            .resizable()
            .scaledToFit()
            .frame(width: 25, height: 25)
            .foregroundColor(currentView == tab ? .blue : .gray)
    }
}

struct TabBarItemTitle: View {
    @Binding var currentView: Tab
    var tab: Tab
    var body: some View {
        Text(tab.rawValue.capitalized)
            .font(.system(size: 10))
            .foregroundColor(currentView == tab ? .blue : .gray)
            .lineLimit(1)
            .multilineTextAlignment(.center)
    }
}

#Preview {
    TabScreen()
}



