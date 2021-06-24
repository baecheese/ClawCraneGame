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
    func moveLastDollToBasket() throws -> Int {
        do {
            try viewModel.moveLastDollToBasket(to: self)
        } catch {
            throw error
        }
        return viewModel.board.score
    }
    
    func startCrane() {
        viewModel.moveCraneAnimation(to: self, column: 1)
    }
    
    func moveCraneLeft() {
        viewModel.moveCraneAnimation(to: self, column: viewModel.cranePosition - 1)
    }
    
    func moveCraneRight() {
        viewModel.moveCraneAnimation(to: self, column: viewModel.cranePosition + 1)
    }
    
}
