//
//  MainGameTypeView.swift
//  ClawCraneGame
//
//  Created by 배지영 on 2021/06/17.
//

import UIKit

class MainGameTypeView: UIView {
    
    @IBOutlet weak var typeLabel: UILabel?
    
    @IBAction func onTouchIncreaseGameType(_ sender: UIButton) {
        SINGLE_GAME.increase()
        typeLabel?.text = SINGLE_GAME.displayText
    }
    
    @IBAction func onTouchDecreaseGameType(_ sender: UIButton) {
        SINGLE_GAME.decrease()
        typeLabel?.text = SINGLE_GAME.displayText
    }
    
}
