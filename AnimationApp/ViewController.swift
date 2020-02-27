//
//  ViewController.swift
//  AnimationApp
//
//  Created by Irina Kopchenova on 26.02.2020.
//  Copyright © 2020 Mikhail Scherbina. All rights reserved.
//

import Spring

class ViewController: UIViewController {

    @IBOutlet weak var springView: SpringView!
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var buttonOutlet: SpringButton!
    
    var originCoordinate: CGFloat?
    var animationsPresets = AnimationPreset.getAnimationPreset()
    var oldItem = 0
    var newItem = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
        
    }

    @IBAction func buttonTapped(_ sender: UIButton) {
        buttonOutlet.scaleX = 1.2
        buttonOutlet.scaleY = 1.2
        buttonOutlet.duration = 0.5
        buttonOutlet.delay = 0.3
        buttonOutlet.animate()
        
        setViewAnimations(set: animationsPresets[newItem])
        setCounter()
        setTextLable(set: animationsPresets[oldItem])
        buttonOutlet.setTitle(animationsPresets[newItem].type, for: .normal)
    }
    
    func updateUI() {
        buttonOutlet.layer.cornerRadius = 10
        textLabel.numberOfLines = 0
        textLabel.text = ""
        buttonOutlet.setTitle(animationsPresets[newItem].type, for: .normal)
        springView.layer.cornerRadius = 10
    }
    
    func setCounter() {
        oldItem = newItem
        if newItem < animationsPresets.count - 1 {
            newItem += 1
        } else {
            newItem = 0
        }
    }
    
    func setViewAnimations(set: AnimationPreset) {
        
        springView.animation = set.type
        springView.curve = set.curve
        springView.duration = set.duaration
        springView.delay = set.delay
        springView.force = set.force
        springView.velocity = set.velocity
        springView.rotate = set.rotate
        springView.animate()
    }
    
    func string(_ value: CGFloat) -> String {
        return String(format: "%.2f", value)
    }
    
    func setTextLable(set: AnimationPreset) {
        textLabel.text = " Animation: \(set.type)\n Curve: \(set.curve)\n Duaration: \(string(set.duaration))\n Delay: \(string(set.delay))\n Force: \(string(set.force))\n Velocity: \(string(set.velocity))\n Rotate: \(string(set.rotate))"
    }
    
}

