//
//  BoardViewController.swift
//  ClawCraneGame
//
//  Created by 배지영 on 2021/06/17.
//

import UIKit

class BoardViewController: BaseViewController {
    
    @IBOutlet weak var boardBackgroundView: UIView?
    @IBOutlet weak var scoreLabel: UILabel!
    
    private var boardView: BoardView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setDefaultContents()
    }
    
    var isFirstLoad = true
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        guard let _ = boardView, isFirstLoad else { return }
        boardView.startCrane()
        isFirstLoad = false
    }
    
    func setDefaultContents() {
        boardView = BoardView()
        boardBackgroundView?.addSubview(boardView)
        boardView.bindFrameToSuperviewBounds()
        boardView.set(board: SINGLE_GAME.random())
    }
    
    @IBAction func onTouchBackToMain(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func onTouchLeft(_ sender: UIButton) {
        boardView.moveCraneLeft()
    }
    
    @IBAction func onTouchRight(_ sender: UIButton) {
        boardView.moveCraneRight()
    }
    
    @IBAction func onTouchCatch(_ sender: UIButton) {
        do {
            let score = try boardView.moveLastDollToBasket()
            scoreLabel.text = "scroe: \(score)"
        } catch {
            print(error)
        }
    }
}
