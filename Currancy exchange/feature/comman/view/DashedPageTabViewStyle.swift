//
//  DashedPageTabViewStyle.swift
//  Currancy exchange
//
//  Created by Tayseer-Anwar on 17/07/2024.
//

import SwiftUI

struct DashedPageTabViewStyle: View {
    let numberOfPages: Int
    let currentIndex: Int
    var body: some View {
        HStack{
            ForEach(0..<numberOfPages, id: \.self) { index in
                Rectangle()
                    .fill(index == currentIndex ? Color.newTintColor : Color.gray)
                    .frame(width: index == currentIndex ? 20 : 10, height: 5.0)
                    .animation(.easeInOut, value: currentIndex)
            }
            
        }
    }
}

#Preview {
    DashedPageTabViewStyle(numberOfPages: 3, currentIndex: 2)
}
