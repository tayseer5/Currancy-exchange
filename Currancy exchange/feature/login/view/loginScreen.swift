//
//  loginScreen.swift
//  Currancy exchange
//
//  Created by Tayseer-Anwar on 12/07/2024.
//

import SwiftUI


/**
 questions
 1) overlay
 2) stroke
 3) RoundedRectangle
 */
//TODO: gradinat background
struct loginScreen: View {
    @State var username: String = ""
    @State var password: String = ""
    @State var useTouchID: Bool = false
    var body: some View {
        VStack{
            HeaderView()
            Text("Login to your Account")
                .font(.customFont(font: .ReadexPro, style: .bold, size: .header))
                .multilineTextAlignment(.center)
                .padding(.horizontal, 20.0)
                .padding(.top, 30.0)
            ZStack {
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
            }.padding(.horizontal, 20.0)
                .padding(.vertical, 10.0)
            ZStack {
                SecureField(
                    "Password",
                    text: $password
                )
                .frame(width: .infinity, height: 20.0)
                .autocapitalization(.none)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(10)
                .overlay{
                    RoundedRectangle(cornerRadius: 10.0)
                        .stroke(.blue,lineWidth: 2)
                }
            }.padding(.horizontal, 20.0)
            
            // Forgot Password
            HStack {
                Text("Forgot your password?")
                    .font(.customFont(font: .ReadexPro, style: .medium, size: .descriptionTitle))
                Button(action: {
                    // Forgot password action
                }) {
                    Text("Click here")
                        .foregroundColor(.newTintColor)
                        .font(.customFont(font: .ReadexPro, style: .medium, size: .descriptionTitle))
                }.padding(.horizontal, -3)
            }
            .padding(.horizontal, 20)
            .padding(.top, 10)
            
            //touch Id toggle
            Toggle("Unlock with Touch ID?", isOn: $useTouchID)
                .padding(.horizontal, 20.0)
                .font(.customFont(font: .ReadexPro, style: .medium, size: .descriptionTitle))
            // Sign in  button
            Button(action: {
                // Action for next button
            }) {
                Text("Sign in ")
                    .font(.customFont(font: .ReadexPro, style: .medium, size: .descriptionTitle))
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, maxHeight: 45.0)
                    .background(Color.newTintColor)
                    .cornerRadius(10)
            }
            .padding(.horizontal, 20)
            .padding(.vertical, 10.0)
            Spacer()
            
            ZStack {
                Divider()
                Text("  or continue with  ")
                    .font(.customFont(font: .ReadexPro, style: .medium, size: .descriptionTitle))
                    .background(Color.white)
            }
            HStack(spacing: 40) {
                Button(action: {
                    // Facebook action
                }) { Image("Facebook")
                        .resizable()
                        .frame(width: 30, height: 30)
                }
                .frame(width: 40, height: 40)
                .overlay{
                    RoundedRectangle(cornerRadius: 10.0)
                        .stroke(.gray,lineWidth: 1)
                }
                
                Button(action: {
                    // Apple action
                }) {
                    Image("Apple")
                        .resizable()
                        .frame(width: 30, height: 30)
                }
                .frame(width: 40, height: 40)
                .overlay{
                    RoundedRectangle(cornerRadius: 10.0)
                        .stroke(.gray,lineWidth: 1)
                }
                
                Button(action: {
                    // Google action
                }) {
                    Image("Google")
                        .resizable()
                        .frame(width: 30, height: 30)
                }
                .frame(width: 40, height: 40)
                .overlay{
                    RoundedRectangle(cornerRadius: 10.0)
                        .stroke(.gray,lineWidth: 1)
                }
            }.padding(30)
            Spacer()
        }
    }
}

#Preview {
    loginScreen()
}
