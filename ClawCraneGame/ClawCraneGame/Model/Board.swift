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
    private var _basket: [Doll] = []
    
    
    var columns: [[Space]] {
        return _columns
    }
    
    var rows: [[Space]] {
        return _rows
    }
    
    var basket: [Doll] {
        return _basket
    }
    
    init(_ board: [[Int]]) {
        // board 배열은 2차원 배열로 크기는 "5 x 5" 이상 "30 x 30" 이하입니다.
        var columns: [[Space]] = []
        var rows: [[Space]] = []
        for columnIndex in 0...board.count - 1 {
            var column: [Space] = []
            for rowIndex in 0...board[columnIndex].count-1 {
                let currentCell = Space(
                    rowIndex: rowIndex,
                    columnIndex: columnIndex,
                    doll: Doll(value: board[columnIndex][rowIndex])
                )
                column.append(currentCell)
                if rowIndex <= rows.count - 1 {
                    rows[rowIndex].append(currentCell)
                } else {
                    rows.append([currentCell])
                }
            }
            columns.append(column)
        }
        self._columns = columns
        self._rows = rows
    }
    
    /// "toColumn" is number. number start 1. not index.
    func last(toColumnNumber: Int) -> Doll? {
        let index = toColumnNumber - 1
        for doll in columns[index] {
//            doll.
        }
        return nil
    }
    
    func moveToBasket(toColumn: Int) -> Doll? {
        return nil
    }
    
}
