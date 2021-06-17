//
//  UIStackView.swift
//  ClawCraneGame
//
//  Created by 배지영 on 2021/06/17.
//

import UIKit

extension UIStackView {
    func removeAllSubviews() {
        guard !subviews.isEmpty else { return }
        subviews.forEach {
            self.removeArrangedSubview($0)
            $0.removeFromSuperview()
        }
    }
}
