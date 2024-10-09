//
//  DashedPageTabViewStyle.swift
//  Currancy exchange
//
//  Created by Tayseer-Anwar on 17/07/2024.
//

import SwiftUI

struct DashedPageTabViewStyle2: View {
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

struct DashedPageTabViewStyle: View {
    let numberOfPages: Int
    let currentIndex: Int
    
    // Customizable colors for active and inactive indicators
    var activeColor: Color = .newTintColor
    var inactiveColor: Color = .gray

    var body: some View {
        HStack(spacing: 8) {
            ForEach(0..<numberOfPages, id: \.self) { index in
                    RoundedRectangle(cornerRadius: 2.5)
                        .fill(index == currentIndex ? activeColor : inactiveColor)
                        .frame(width: index == currentIndex ? 20 : 10, height: 5.0)
                        .accessibilityLabel("Page \(index + 1)")
                        .accessibilityIdentifier("PageIndicator\(index)")
            }
        }
        .animation(.easeInOut, value: currentIndex) // Apply animation to the HStack
        .accessibilityElement(children: .combine)
        .accessibilityLabel("Page Indicators")
        .accessibilityIdentifier("PageIndicatorsView")
    }
}

#Preview {
    DashedPageTabViewStyle(numberOfPages: 3, currentIndex: 2)
}
