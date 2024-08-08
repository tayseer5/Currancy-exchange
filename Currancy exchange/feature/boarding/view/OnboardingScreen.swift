//
//  OnboardingScreen.swift
//  Currancy exchange
//
//  Created by Tayseer-Anwar on 12/07/2024.
//

import Foundation

/**
 questions
 2) can we make a custome style for header
 3) custome font
 
 */

//TODO: 1) animate image while it slide
import SwiftUI

struct OnboardingScreen: View {
    var body: some View {
        NavigationView {
            VStack(alignment: .center, spacing: 20) {
                // Image slider
                ImageSlider()
                // Next button
                NavigationLink(destination: NextScreen()) { // Use NavigationLink for navigation
                    HStack {
                        Spacer()
                        Text("Next")
                            .font(.headline)
                        Spacer()
                    }
                    .frame(height: 44) // Standard height for buttons
                }
                .buttonStyle(BorderedProminentButtonStyle())
                .tint(.newTintColor)
                .padding(.bottom, 20)
                .padding(.horizontal, 20)
                .accessibilityIdentifier("NextButton") // Accessibility identifier
                Spacer()
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    HStack(alignment: .center){
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
    }
}
//convert to function
//if i use this code slider not work
/*
 {
 ForEach(viewModel.slides) { slide in
 VStack ( spacing: 10){
 Image(slide.imageName)
 .resizable()
 .aspectRatio(contentMode: .fit)
 Group {
 Text(slide.title)
 .frame(alignment: .center)
 .font(.customFont(font: .ReadexPro, style: .bold, size: .header))
 Text(slide.infoTitle)
 .font(.customFont(font: .ReadexPro, style: .medium, size: .descriptionTitle))
 .padding(.horizontal, 20)
 }.multilineTextAlignment(.center)
 }
 .tag(slide.id)
 }
 }
 */
struct ImageSlider: View {
    @StateObject private var viewModel = OnboardingViewModel()
    var body: some View {
        VStack {
            TabView(selection: $viewModel.currentIndex) {
                ForEach(0..<$viewModel.slides.count, id: \.self) { index in
                    sliderView(for: viewModel.slides[index])
                        .tag(index)
                }
            }
            .tabViewStyle(.page)
            .animation(.easeInOut, value: viewModel.currentIndex) // Add animation
            DashedPageTabViewStyle(numberOfPages: viewModel.slides.count, currentIndex: viewModel.currentIndex)
            Spacer()
        }
    }
}

private func sliderView(for slider: OnboardingModel) -> some View {
    VStack ( spacing: 10){
        Image(slider.imageName)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .accessibilityLabel(slider.title)
        Group {
            Text(slider.title)
                .frame(alignment: .center)
                .font(.customFont(font: .ReadexPro, style: .bold, size: .header))
            Text(slider.infoTitle)
                .font(.customFont(font: .ReadexPro, style: .medium, size: .descriptionTitle))
                .padding(.horizontal, 20)
        }.multilineTextAlignment(.center)
    }
}

struct NextScreen: View {
    var body: some View {
        Text("Welcome to the Next Screen!")
            .font(.largeTitle)
            .padding()
            .navigationTitle("Next")
    }
}


#Preview {
    OnboardingScreen()
}
