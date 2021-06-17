//
//  BoardView.swift
//  ClawCraneGame
//
//  Created by 배지영 on 2021/06/17.
//

import UIKit

class BoardView: UIView {
    
    var board: Board!
    var boardStackView: UIStackView!
    
    func set(board: Board) {
        self.board = board
        print(board.description)
        self.boardStackView = UIStackView()
        addSubview(boardStackView)
        boardStackView.bindFrameToSuperviewBounds()
        self.boardStackView?.axis = .horizontal
        self.boardStackView?.alignment = .fill
        self.boardStackView?.distribution = .fillEqually
        self.boardStackView.spacing = 1.0
        for column in 0...board.columns.count - 1 {
            let columnStackView = UIStackView()
            columnStackView.axis = .vertical
            columnStackView.alignment = .fill
            columnStackView.distribution = .fillEqually
            columnStackView.spacing = 1.0
            for index in 0...board.columns[column].count - 1 {
                
                let space = UILabel()
                space.text = board.columns[column][index].doll?.type.icon ?? "-"
                space.textAlignment = .center
                columnStackView.addArrangedSubview(space)
            }
            boardStackView.addArrangedSubview(columnStackView)
        }
    }
    
}
