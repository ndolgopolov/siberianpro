//
//  UIView+extension.swift
//  siberianpro
//
//  Created by ndolgopolov on 24.08.17.
//  Copyright © 2017 ndolgopolov. All rights reserved.
//

import UIKit

extension UIView {
    func rotateView(duration: CFTimeInterval = 1.0, direction: Double = 1.0) {
        let animation = CABasicAnimation(keyPath: "transform.rotation")
        animation.fromValue = 0.0
        animation.toValue = CGFloat(Double.pi * 2.0*direction)
        animation.duration = duration
        self.layer.add(animation, forKey: nil)
    }
}
