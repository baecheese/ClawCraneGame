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
    
    func bindFrameToSuperviewBounds(to parent: UIView? = nil, top: CGFloat? = nil, leading: CGFloat? = nil, trailing: CGFloat? = nil, bottom: CGFloat? = nil) {
        guard let superview = parent ?? self.superview else { return }
        self.translatesAutoresizingMaskIntoConstraints = false
        if let top = top {
            self.topAnchor.constraint(equalTo: superview.topAnchor, constant: top).isActive = true
        }
        if let leading = leading {
            self.leadingAnchor.constraint(equalTo: superview.leadingAnchor, constant: leading).isActive = true
        }
        if let trailing = trailing {
            self.trailingAnchor.constraint(equalTo: superview.trailingAnchor, constant: trailing * -1).isActive = true
        }
        if let bottom = bottom {
            self.bottomAnchor.constraint(equalTo: superview.bottomAnchor, constant: bottom * -1).isActive = true
        }
    }
    
    func addWidth(constant: CGFloat, relation: NSLayoutConstraint.Relation = .equal) {
        let constraint = NSLayoutConstraint(
            item: self,
            attribute: .width,
            relatedBy: relation,
            toItem: nil,
            attribute: .notAnAttribute,
            multiplier: 1,
            constant: constant
        )
        addConstraint(constraint)
    }
}
