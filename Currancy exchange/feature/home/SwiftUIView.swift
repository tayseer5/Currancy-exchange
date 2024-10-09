//
//  SwiftUIView.swift
//  Currancy exchange
//
//  Created by Tayseer-Anwar on 08/08/2024.
//

import SwiftUI

struct SwiftUIView: View {
    var body: some View {
            NavigationView {
                Text("Primary")
                Text("Secondary")
            }
        }
}

#Preview {
    SwiftUIView()
}

struct ResultView: View {
    var choice: String

    var body: some View {
        Text("You chose \(choice)")
    }
}
