//
//  CustomeTextField.swift
//  Currancy exchange
//
//  Created by Tayseer-Anwar on 14/07/2024.
//

import SwiftUI

struct CustomeTextField: View {
    @State var username: String = ""
    var body: some View {
            TextField(
                "Username",
                text: $username
            )
            .keyboardType(.emailAddress)
            .frame(width: .infinity, height: 20.0)
            .autocapitalization(.none)
            .padding()
            .background(Color.gray.opacity(0.2))
            .cornerRadius(10)
            .overlay{
                RoundedRectangle(cornerRadius: 10.0)
                    .stroke(.blue,lineWidth: 2)
            }
            .overlay(starOverlay, alignment: .trailing)
            .padding(.horizontal, 20.0)
                .padding(.vertical, 10.0)
        }
}
private var starOverlay: some View {
        Image(systemName: "star")
    .foregroundColor(.white)
    .padding(10)
    }

#Preview {
    CustomeTextField()
}
