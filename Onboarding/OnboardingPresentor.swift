//
//  OnboardingPresentor.swift
//  kudaGoSpb
//
//  Created by Виктория Козырева on 31.05.2021.
//

import Foundation

enum OnboardingType {
    case location
    case event
}

class OnboardingPresentor {
    static var shared = OnboardingPresentor()
    var currentOnboardScreen: OnboardingType = .location

}
