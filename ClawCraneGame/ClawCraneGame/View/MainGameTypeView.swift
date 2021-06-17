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
        gameType.increase()
        typeLabel?.text = gameType.displayText
    }
    
    @IBAction func onTouchDecreaseGameType(_ sender: UIButton) {
        gameType.decrease()
        typeLabel?.text = gameType.displayText
    }
    
}
