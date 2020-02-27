//
//  AnimationPreset.swift
//  AnimationApp
//
//  Created by Irina Kopchenova on 27.02.2020.
//  Copyright © 2020 Mikhail Scherbina. All rights reserved.
//

import UIKit

struct AnimationPreset {
    let type: String
    let curve: String
    let duaration: CGFloat
    let delay: CGFloat
    let force: CGFloat
    let velocity: CGFloat
    let rotate: CGFloat
}

extension AnimationPreset {
    
    static func getAnimationPreset() -> [AnimationPreset] {
        let animations = ["slideLeft", "slideRight",
                         "slideDown", "slideUp",
                         "squeezeLeft", "squeezeRight", "squeezeDown",
                         "fadeIn", "fadeOut", "fadeOutIn",
                         "fadeInLeft", "fadeInDown", "fadeInUp",
                         "zoomIn", "zoomOut", "fall", "shake", "pop",
                         "flipX", "flipY", "morph", "squeeze", "flash",
                         "wobble", "swing"]
        let curves = ["easeIn", "easeOut", "easeInOut", "linear",
                      "spring", "easeInSine", "easeOutSine", "easeInOutSine",
                      "easeInQuad", "easeOutQuad", "easeInOutQuart",
                      "easeInQuint", "easeOutQuint", "easeInOutQuint",
                      "easeInExpo", "easeOutExpo", "easeInOutExpo",
                      "easeInCirc", "easeInOutCirc", "easeInOutCirc",
                      "easeInBack", "easeOutBack", "easeInOutBack"]
        
        let minCount = min(animations.count, curves.count)
        var preset = [AnimationPreset]()
        
        for _ in 0..<minCount {
            preset.append(AnimationPreset(type: (animations.randomElement() ?? ""),
                                          curve: (curves.randomElement() ?? ""),
                                          duaration: CGFloat.random(in: 0.5...1),
                                          delay: CGFloat.random(in: 0.5...1),
                                          force: CGFloat.random(in: 0.5...1.5),
                                          velocity: CGFloat.random(in: 0...1),
                                          rotate: CGFloat.random(in: -90...90)))
        }
        return preset
    }
}
