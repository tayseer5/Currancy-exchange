//
//  OnboardingScreen.swift
//  Currancy exchange
//
//  Created by Tayseer-Anwar on 12/07/2024.
//

import Foundation

/**
 questions
 1) there was ay enhance in this code
 2) can we make a custome style for header
 3) custome font
 
 */

//TODO: 1) animate image while it slide
import SwiftUI

struct OnboardingScreen: View {
    var body: some View {
        VStack(spacing: 20.0) {
            HeaderView()
            
            // Image slider
            ImageSlider()
            
            // Next button
            Button(action: {
                // Action for next button
            }) {
                HStack{
                    Spacer()
                    Text("Next")
                        .font(.headline)
                    // .foregroundColor(.white)
                    Spacer()
                }.frame(height: 30)
            }
            
            .buttonStyle(BorderedProminentButtonStyle())
            .padding(.horizontal, 20)
//            .background(Color.newTintColor)
//            .cornerRadius(10)
//            .padding(.top, 40)
            Spacer()
        }
    }
}
//convert to function
struct ImageSlider: View {
    @StateObject private var viewModel = OnboardingViewModel()
    
    var body: some View {
        TabView(selection: $viewModel.currentIndex) {
            ForEach(0..<$viewModel.slides.count, id: \.self) { index in
                VStack {
                    Image(viewModel.slides[index].imageName)
                        .resizable()
                        .scaledToFit()
                    Text(viewModel.slides[index].title)
                        .multilineTextAlignment(.center)
                        .frame(alignment: .center)
                        .font(.customFont(font: .ReadexPro, style: .bold, size: .header))
                    Text(viewModel.slides[index].infoTitle)
                        .font(.customFont(font: .ReadexPro, style: .medium, size: .descriptionTitle))
                        .multilineTextAlignment(.center)
                        .padding(.top,10)
                        .padding(.horizontal, 20)
                        .padding(.bottom, 30)
                    
                }
            }
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
        // make custome pagetabviewstyle and add it in tabviewstyle
        HStack{
            ForEach(0..<$viewModel.slides.count, id: \.self) { index in
                Rectangle()
                    .fill(index == viewModel.currentIndex ? Color.newTintColor : Color.gray)
                    .frame(width: index == viewModel.currentIndex ? 20 : 10, height: 5.0)
                    .animation(.easeInOut, value: viewModel.currentIndex)
                    .padding(.bottom, 10)
            }
        }
    }
}

#Preview {
    OnboardingScreen()
}
