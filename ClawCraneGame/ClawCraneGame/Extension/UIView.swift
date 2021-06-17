//
//  UIView.swift
//  ClawCraneGame
//
//  Created by 배지영 on 2021/06/17.
//

import UIKit
extension UIView {
    
    
    func bindFrameToSuperviewBounds(to parent: UIView? = nil, constant: CGFloat = 0.0) {
        guard let superview = parent ?? self.superview else { return }
        self.translatesAutoresizingMaskIntoConstraints = false
        self.topAnchor.constraint(equalTo: superview.topAnchor, constant: constant).isActive = true
        self.bottomAnchor.constraint(equalTo: superview.bottomAnchor, constant: constant * -1).isActive = true
        self.leadingAnchor.constraint(equalTo: superview.leadingAnchor, constant: constant).isActive = true
        self.trailingAnchor.constraint(equalTo: superview.trailingAnchor, constant: constant * -1).isActive = true
    }
}
