//
//  CustomeTextField.swift
//  Currancy exchange
//
//  Created by Tayseer-Anwar on 14/07/2024.
//

import SwiftUI

//TODO: check is it butter to make each type of textfield separeted becouse i need to add logic of hidden and display data of secure filed and logic of make icon button 
struct CustomeTextField: View {
    @Binding var text: String
    var placeHolder: String
    var keyboardType: UIKeyboardType = .default
    var iconImage: Image = Image(systemName: "eye.fill")
    @Binding var isSecure: Bool
    @Binding var disabledButton: Bool
    
    var body: some View {
        HStack {
            Group {
                if isSecure {
                    SecureField(placeHolder, text: $text)
                } else {
                    TextField(placeHolder, text: $text)
                }
            }
            .keyboardType(keyboardType)
            .autocapitalization(.none)
            .padding(.leading)
            
            Button(action: {
                isSecure.toggle()
            }) {
                iconImage
                    .foregroundColor(.blue)
                    .padding(.trailing)
            }.disabled(disabledButton)
        }
        .frame(height: 40)
        .background(Color.gray.opacity(0.2))
        .cornerRadius(10)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.blue, lineWidth: 2)
        )
    }
}

struct CustomeTextField_Previews: PreviewProvider {
    static var previews: some View {
        CustomeTextField(
            text: .constant(""),
            placeHolder: "Enter text",
            isSecure: .constant(true),
            disabledButton: .constant(true)
        )
    }
}
