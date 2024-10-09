//
//  HeaderView.swift
//  Currancy exchange
//
//  Created by Tayseer-Anwar on 12/07/2024.
//

import SwiftUI

struct HeaderView: View {
    var body: some View {
        HStack(alignment: .center){
            Image("Coinmoney-logo")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 30, height: 30)
            Text("Coinmoney")
                .font(.customFont(font: .ReadexPro, style: .bold, size: .title))
                .foregroundColor(.newTintColor)
        }
        .frame(height: 90.0)
    }
}

#Preview {
    HeaderView()
}
