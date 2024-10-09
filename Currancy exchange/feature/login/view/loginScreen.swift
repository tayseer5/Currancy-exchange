//
//  loginScreen.swift
//  Currancy exchange
//
//  Created by Tayseer-Anwar on 12/07/2024.
//

import SwiftUI


/**
 questions
 read cleaned code
 working with touch id
 save credentials
 
 */
//TODO: gradinat background
struct loginScreen: View {
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var useTouchID: Bool = false
    @State private var isSecure: Bool = true
    
    var body: some View {
        NavigationView {
            VStack(spacing: 25) {
                // Header
                Text("Login to your Account")
                    .font(.customFont(font: .ReadexPro, style: .bold, size: .header))
                    .multilineTextAlignment(.center)
                // Username and Password Fields
                CustomeTextField(text: $username, placeHolder: "Username", keyboardType: .emailAddress, iconImage: Image(systemName: "envelope"), isSecure: .constant(false), disabledButton: .constant(true))
                CustomeTextField(text: $password, placeHolder: "Password", keyboardType: .default, iconImage: Image(systemName: "lock.fill"), isSecure: $isSecure, disabledButton: .constant(false))
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
                    }
                    .padding(.horizontal, -3)
                }
                
                // Toggle for Touch ID
                Toggle("Unlock with Touch ID?", isOn: $useTouchID)
                    .padding(.horizontal, 20)
                    .font(.customFont(font: .ReadexPro, style: .medium, size: .descriptionTitle))
                
                // Sign In Button
                NavigationLink(destination: SwiftUIView()) { // Use NavigationLink for navigation
                    HStack {
                        Spacer()
                        Text("Sign in")
                            .font(.customFont(font: .ReadexPro, style: .medium, size: .descriptionTitle))
                        Spacer()
                    }
                    .frame(height: 44) // Standard height for buttons
                }
                .buttonStyle(BorderedProminentButtonStyle())
                .tint(.newTintColor)
                .padding(.bottom, 20)
                .accessibilityIdentifier("SignInButton") // Accessibility identifier
                
                Spacer()
                
                // Continue with Section
                ZStack {
                    Divider()
                    Text("  or continue with  ")
                        .font(.customFont(font: .ReadexPro, style: .medium, size: .descriptionTitle))
                        .background(Color.white)
                }
                
                HStack(spacing: 40) {
                    SocialButton(imageName: "Facebook", action: {
                        // Facebook login action
                    })
                    SocialButton(imageName: "Apple", action: {
                        // Apple login action
                    })
                    SocialButton(imageName: "Google", action: {
                        // Google login action
                    })
                }.padding(30)
                
                Spacer()
            }
            .padding(.horizontal, 20)
            .padding(.top, 30)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    HStack {
                        Image("Coinmoney-logo")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 30, height: 30)
                            .accessibilityLabel("Coinmoney Logo")
                        Text("Coinmoney")
                            .font(.customFont(font: .ReadexPro, style: .bold, size: .title))
                            .foregroundColor(.newTintColor)
                    }
                }
            }
        }
        .navigationBarBackButtonHidden(true)
        .statusBar(hidden: true)
    }
}

struct SocialButton: View {
    let imageName: String
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Image(imageName)
                .resizable()
                .frame(width: 30, height: 30)
        }
        .frame(width: 40, height: 40)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.gray, lineWidth: 1)
        )
    }
}

#Preview {
    loginScreen()
}
