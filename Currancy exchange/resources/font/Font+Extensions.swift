//
//  Font+Extensions.swift
//  Currancy exchange
//
//  Created by Tayseer-Anwar on 23/06/2024.
//

import SwiftUI

enum CustomFonts: String {
    case ReadexPro = "ReadexPro"
    
}

enum CustomFontStyle: String {
    case bold = "-bold"
    case light = "-Light"
    case medium = "-Medium"
}

enum CustomFontSize: CGFloat {
    case header = 32.0
    case title = 24.0
    case descriptionTitle = 14.0
}

extension Font {
    
    /// Choose your font to set up
    /// - Parameters:
    ///   - font: Choose one of your font
    ///   - style: Make sure the style is available
    ///   - size: Use prepared sizes for your app
    ///   - isScaled: Check if your app accessibility prepared
    /// - Returns: Font ready to show
    static func customFont(
        font: CustomFonts,
        style: CustomFontStyle,
        size: CustomFontSize,
        isScaled: Bool = true) -> Font {
            
            let fontName: String = font.rawValue + style.rawValue
            
            return Font.custom(fontName, size: size.rawValue)
        }
}
