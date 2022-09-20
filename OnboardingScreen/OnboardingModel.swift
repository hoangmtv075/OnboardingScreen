//
//  OnboardingModel.swift
//  OnboardingScreen
//
//  Created by Thanh Hoang on 19/09/2022.
//

import UIKit

class OnboardingModel {
    
    let title: String
    let sub: String
    var image: UIImage?
    let bgColor: UIColor
    
    init(title: String, sub: String, image: UIImage?, bgColor: UIColor) {
        self.title = title
        self.sub = sub
        self.image = image
        self.bgColor = bgColor
    }
    
    static func shared() -> [OnboardingModel] {
        return [
            OnboardingModel(title: "DISCOVERY",
                            sub: "Digital NFT marketplace",
                            image: UIImage(named: "welcome-1"),
                            bgColor: UIColor(hex: 0xE8F0F6)),
            OnboardingModel(title: "COLLECT",
                            sub: "Rarest items from the best digital artists",
                            image: UIImage(named: "welcome-2"),
                            bgColor: UIColor(hex: 0xFFF8FC)),
            OnboardingModel(title: "CONNECT WALLET",
                            sub: "We do not own your private keys and  cannot access your funds without your confirmation",
                            image: UIImage(named: "welcome-3"),
                            bgColor: UIColor(hex: 0xEEEDFF)),
            OnboardingModel(title: "NFT CREATOR",
                            sub: "AI filter, draw pixel and more",
                            image: UIImage(named: "welcome-4"),
                            bgColor: UIColor(hex: 0xF6F0FE)),
        ]
    }
}
