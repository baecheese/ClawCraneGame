//
//  BoardViewController.swift
//  ClawCraneGame
//
//  Created by 배지영 on 2021/06/17.
//

import UIKit

class BoardViewController: BaseViewController {
    
    @IBOutlet weak var boardBackgroundView: UIView?
    private var boardView: BoardView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setDefaultContents()
    }
    
    func setDefaultContents() {
        boardView = BoardView()
        boardView.set(board: gameType.random())
        boardBackgroundView?.addSubview(boardView)
        boardView.bindFrameToSuperviewBounds()
    }
    
    @IBAction func onTouchBackToMain(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }

}
