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
                Button(action: {
                    // Action for next button
                }) {
                    HStack{
                        Spacer()
                        Text("Next")
                            .font(.headline)
                        Spacer()
                    }.frame(height: 30)
                }
                .buttonStyle(BorderedProminentButtonStyle())
                .tint(.newTintColor)
                .padding(.bottom, 20)
                .padding(.horizontal, 20)
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
                }
            }
            .tabViewStyle(.page)
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

#Preview {
    OnboardingScreen()
}
