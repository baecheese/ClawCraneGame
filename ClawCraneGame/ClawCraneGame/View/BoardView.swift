//
//  BoardView.swift
//  ClawCraneGame
//
//  Created by 배지영 on 2021/06/17.
//

import UIKit

class BoardView: UIView {
    
    private var _board: Board!
    private var boardStackView: UIStackView!
    private var basketStackView: UIStackView!
    private var basketWidth: CGFloat = 100.0
    
    func set(board: Board) {
        self._board = board
        //board stack view
        self.boardStackView = UIStackView()
        self.addSubview(boardStackView)
        self.boardStackView.bindFrameToSuperviewBounds(top: 0.0, leading: 0.0, trailing: basketWidth, bottom: 0.0)
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
                //TODO: space view
                let space = UILabel()
                space.text = board.columns[column][index].doll?.type.icon ?? "-"
                space.textAlignment = .center
                columnStackView.addArrangedSubview(space)
            }
            boardStackView.addArrangedSubview(columnStackView)
        }
        // basket stack view
        self.basketStackView = UIStackView()
        self.addSubview(basketStackView)
        self.basketStackView.bindFrameToSuperviewBounds(top: 0.0, trailing: 0.0, bottom: 0.0)
        self.basketStackView.addWidth(constant: basketWidth)
        self.basketStackView?.axis = .vertical
        self.basketStackView?.alignment = .fill
        self.basketStackView?.distribution = .fillEqually
        self.basketStackView.spacing = 1.0
        
        let test = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 100.0, height: 100.0))
        test.backgroundColor = .red
        let test2 = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 100.0, height: 100.0))
        test2.backgroundColor = .yellow
        basketStackView.addArrangedSubview(test)
        basketStackView.addArrangedSubview(test2)
    }
    
}
