//
//  Board.swift
//  ClawCraneGame
//
//  Created by 배지영 on 2021/06/16.
//

import Foundation

class Board {
    
    private var _columns: [[Space]]
    private var _rows: [[Space]]
    private var _basket: Basket
    
    var columns: [[Space]] {
        return _columns
    }
    
    var rows: [[Space]] {
        return _rows
    }
    
    var dollsInBasket: [Doll] {
        return _basket.dolls
    }
    
    init(_ board: [[Int]]) {
        // board 배열은 2차원 배열로 크기는 "5 x 5" 이상 "30 x 30" 이하입니다.
        var columns: [[Space]] = []
        var rows: [[Space]] = []
        for columnIndex in 0...board.count - 1 {
            var column: [Space] = []
            for rowIndex in 0...board[columnIndex].count-1 {
                let currentSpace = Space(
                    rowIndex: rowIndex,
                    columnIndex: columnIndex,
                    doll: Doll(value: board[columnIndex][rowIndex])
                )
                column.append(currentSpace)
                if rowIndex <= rows.count - 1 {
                    rows[rowIndex].append(currentSpace)
                } else {
                    rows.append([currentSpace])
                }
            }
            columns.append(column)
        }
        self._columns = columns
        self._rows = rows
        self._basket = Basket()
    }
    
    /// "toColumn" is number. number start 1. not index.
    func last(toColumnNumber: Int) -> Space? {
        guard 0 < toColumnNumber, let index = lastIndexToFillSpace(toColumnNumber: toColumnNumber) else { return nil }
        return columns[toColumnNumber - 1][index]
    }
    
    func lastIndexToFillSpace(toColumnNumber: Int) -> Int? {
        let columnIndex = toColumnNumber - 1
        let currentColumn = columns[columnIndex]
        for index in 0...currentColumn.count - 1 {
            guard false == currentColumn[index].isEmpty else { continue }
            return index
        }
        return nil
    }
    
    @discardableResult
    func moveToBasket(toColumnNumber: Int) -> Doll? {
        guard 0 < toColumnNumber,
              let index = lastIndexToFillSpace(toColumnNumber: toColumnNumber),
              let lastDoll = columns[toColumnNumber - 1][index].pop() else { return nil }
        _basket.add(doll: lastDoll)
        return lastDoll
    }
    
}
