//
//  SpaceViewModel.swift
//  ClawCraneGame
//
//  Created by 배지영 on 2021/06/18.
//

import UIKit

class SpaceViewModel {
    
    private var _space: Space
    
    var space: Space {
        return _space
    }
    
    init(_ space: Space) {
        self._space = space
    }
    
    func setContents(to parent: SpaceView) {
        parent.iconImage?.image = _space.isEmpty ? nil : _space.doll?.type.icon
        parent.bombImage?.image = Space.State.bomb.icon
        parent.bombImage?.alpha = 0.0
    }
    
    func showAnimation(to parent: SpaceView, state: Space.State) {
        switch state {
        case .empty, .fill:
            return
        case .bomb:
            showBombAnimation(to: parent)
        }
    }
    
    private func showBombAnimation(to parent: SpaceView) {
        UIView.animate(
            withDuration: 0.3,
            animations: {
                parent.iconImage?.alpha = 0.0
                parent.bombImage?.alpha = 1.0
            },
            completion: { _ in
                // remove doll icon
                parent.iconImage?.image = nil
                UIView.animate(
                    withDuration: 0.3,
                    animations: {
                        parent.iconImage?.alpha = 1.0
                        parent.bombImage?.alpha = 0.0
                    }
                )
            }
        )
    }
}
