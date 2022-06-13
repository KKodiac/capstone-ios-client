//
//  AnimationView.swift
//  fdrone
//
//  Created by Sean Hong on 2022/06/14.
//

import UIKit
import Lottie

class AnimationController: UIViewController {
    private var animationView: AnimationView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        animationView = .init(name: "map")
        animationView!.frame = view.bounds
        animationView!.contentMode = .scaleAspectFit
        animationView!.loopMode = .loop
        animationView!.animationSpeed = 0.5
        view.addSubview(animationView!)
        animationView!.play()
    }
}
