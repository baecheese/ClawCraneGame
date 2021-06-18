//
//  MainViewController.swift
//  ClawCraneGame
//
//  Created by 배지영 on 2021/06/17.
//

import UIKit

var SINGLE_GAME: Game = Game.shared

class MainViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func onTouchStartGame(_ sender: UIButton) {
        guard let boardViewController = storyboard?.instantiateViewController(withIdentifier: BoardViewController.className) else { return }
        present(boardViewController, animated: true, completion: nil)
    }
}
