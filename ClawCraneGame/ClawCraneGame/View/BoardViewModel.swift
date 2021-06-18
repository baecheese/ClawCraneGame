//
//  BoardViewModel.swift
//  ClawCraneGame
//
//  Created by 배지영 on 2021/06/17.
//

import UIKit

class BoardViewModel {
    
    private var _board: Board
    private var basketWidth: CGFloat = 100.0
    
    private var _cranePosition: Int
    
    var cranePosition: Int {
        return _cranePosition
    }
    
    var craneSize: CGFloat {
        return 40.0
    }
    
    var board: Board {
        return _board
    }
    
    init(board: Board) {
        self._board = board
        self._cranePosition = 1
    }
    
    func setStartContents(to parent: BoardView) {
        //board stack view
        parent.boardStackView = UIStackView()
        parent.addSubview(parent.boardStackView)
        parent.boardStackView.bindFrameToSuperviewBounds(top: 0.0, leading: 0.0, trailing: basketWidth, bottom: 0.0)
        parent.boardStackView?.axis = .horizontal
        parent.boardStackView?.alignment = .fill
        parent.boardStackView?.distribution = .fillEqually
        parent.boardStackView.spacing = 1.0
        for column in 0...board.columns.count - 1 {
            let columnStackView = UIStackView()
            columnStackView.axis = .vertical
            columnStackView.alignment = .fill
            columnStackView.distribution = .fillEqually
            columnStackView.spacing = 1.0
            for index in 0...board.columns[column].count - 1 {
                let spaceView = SpaceView.instanceFromNib()
                spaceView.setContents(space: board.columns[column][index])
                columnStackView.addArrangedSubview(spaceView)
            }
            parent.boardStackView.addArrangedSubview(columnStackView)
        }
        
        // basket stack view
        parent.basketStackView = UIStackView()
        parent.addSubview(parent.basketStackView)
        parent.basketStackView.bindFrameToSuperviewBounds(top: 0.0, trailing: 0.0, bottom: 0.0)
        parent.basketStackView.addWidth(constant: basketWidth)
        parent.basketStackView?.axis = .vertical
        parent.basketStackView?.alignment = .fill
        parent.basketStackView?.distribution = .fillEqually
        parent.basketStackView?.spacing = 1.0
        parent.basketStackView?.backgroundColor = .systemYellow
        for index in 0...board.basket.max - 1 {
            let spaceView = SpaceView.instanceFromNib()
            let space = Space(rowIndex: index, columnIndex: 0, doll: nil)
            spaceView.setContents(space: space)
            parent.basketStackView?.addArrangedSubview(spaceView)
        }
        
        // craneView
        parent.craneView = UILabel(frame: CGRect(x: 0.0, y: 0.0, width: craneSize, height: craneSize))
        parent.addSubview(parent.craneView)
        parent.craneView.addWidth(constant: 40.0)
        parent.craneView.text = "▼"
        parent.craneView.font = UIFont.systemFont(ofSize: 40.0)
    }
    
    func moveCraneAnimation(to parent: BoardView, column number: Int) {
        guard 0 < number && number <= board.columns.count else { return }
        self._cranePosition = number
        let toOffsetX = craneOffsetX(to: parent, column: number)
        UIView.animate(withDuration: 0.5, animations: {
            parent.craneView.frame.origin.x = toOffsetX
        })
    }
    
    // TODO: crane 모델 생성할 것
    // 임시코드 : drection : false <-> true
    func moveCraneAnimation(to parent: BoardView, right direction: Bool) {
        moveCraneAnimation(to: parent, column: _cranePosition + ((true == direction ? 1 : -1)))
    }
    
    func moveLastDollToBasket(to parent: BoardView) throws {
        do {
            guard let space = board.lastToFillSapace(columnNumber: cranePosition) else { throw Board.BoardError.invaildSpace }
            let doll = try board.moveLastDollToBasket(columnNumber: cranePosition)
            guard let column = parent.boardStackView.subviews[space.position.column] as? UIStackView,
                  let spaceView = column.subviews[space.position.row] as? SpaceView else { return }
            spaceView.showAnimation(state: .bomb)
            try showAddBasketAnimation(to: parent, doll: doll)
        } catch {
            throw error
        }
    }
    
    private func showAddBasketAnimation(to parent: BoardView, doll: Doll) throws {
        guard let index = board.basket.lastIndex_vaildInputDoll else { throw Basket.BasketError.isFull }
        let lastStackIndex = board.basket.max - index // 아래로 쌓여야함
        guard let spaceView = parent.basketStackView.subviews[lastStackIndex] as? SpaceView else { return }
        spaceView.showAnimation(state: .fill(image: doll.type.icon))
    }
    
    
    private func spaceWidth(to parent: BoardView) -> CGFloat {
        return parent.boardStackView.frame.width / CGFloat(board.columns.count)
    }
    
    private func craneOffsetX(to parent: BoardView, column: Int) -> CGFloat {
        return (spaceWidth(to: parent) * CGFloat(column - 1)) + spaceWidth(to: parent) / 2
    }
}
