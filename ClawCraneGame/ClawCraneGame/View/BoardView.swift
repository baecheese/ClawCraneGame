//
//  BoardView.swift
//  ClawCraneGame
//
//  Created by 배지영 on 2021/06/17.
//

import UIKit

class BoardView: UIView {
    
    var boardStackView: UIStackView!
    var basketStackView: UIStackView!
    var craneView: UILabel!
    private var viewModel: BoardViewModel!
    
    
    var board: Board {
        return viewModel.board
    }
    
    func set(board: Board) {
        viewModel = BoardViewModel(board: board)
        viewModel.setStartContents(to: self)
    }
    
    @discardableResult
    func moveLastDollToBasket() -> Int {
        viewModel.moveLastDollToBasket(to: self)
        return viewModel.board.score
    }
    
    func moveCraneLeft() {
        viewModel.moveCraneAnimation(to: self, right: false)
    }
    
    func moveCraneRight() {
        viewModel.moveCraneAnimation(to: self, right: true)
    }
    
}
