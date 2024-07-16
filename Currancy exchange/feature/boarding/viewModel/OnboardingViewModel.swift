//
//  OnboardingViewModel.swift
//  Currancy exchange
//
//  Created by Tayseer-Anwar on 15/07/2024.
//

import Foundation


class OnboardingViewModel: ObservableObject {
    @Published var slides: [OnboardingModel] = [
        OnboardingModel(title: "Take hold of your finances", infoTitle: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut eget mauris massa pharetra.", imageName: "onboarding"),
        OnboardingModel(title: "Smart trading tools", infoTitle: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut eget mauris massa pharetra.", imageName: "onboarding2"),
        OnboardingModel(title: "Invest in the future", infoTitle: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut eget mauris massa pharetra.", imageName: "onboarding3")
    ]
    
    @Published var currentIndex: Int = 0
    
    init() {
           // fetchSlides()
        }

//    func getCurrentSlider() ->  OnboardingModel{
//        return slides[currentIndex]
//    }
//    
//    func getSliderCount() ->  Int{
//        return slides.count
//    }
    
  /* private func fetchSlides() {
        // Simulate fetching data
         slides = [
            OnboardingModel(title: "Take hold of your finances", infoTitle: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut eget mauris massa pharetra.", imageName: "onboarding"),
            OnboardingModel(title: "Smart trading tools", infoTitle: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut eget mauris massa pharetra.", imageName: "onboarding2"),
            OnboardingModel(title: "Invest in the future", infoTitle: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut eget mauris massa pharetra.", imageName: "onboarding3")
        ]
    }
    */
}
