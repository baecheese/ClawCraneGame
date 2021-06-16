//
//  Board.swift
//  ClawCraneGame
//
//  Created by 배지영 on 2021/06/16.
//

import Foundation

class Board {
    
    private var columns: [[Doll]]
    private var rows: [[Doll]]
    private var basket: [Doll] = []
    
    init(_ board: [[Int]]) {
        // board 배열은 2차원 배열로 크기는 "5 x 5" 이상 "30 x 30" 이하입니다.
        var columns: [[Doll]] = []
        var rows: [[Doll]] = []
        for columnIndex in 0...board.count - 1 {
            var column: [Doll] = []
            for rowIndex in 0...board[columnIndex].count-1 {
                let currentCell = Doll(
                    rowIndex: rowIndex,
                    columnIndex: columnIndex,
                    value: board[columnIndex][rowIndex]
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
        self.columns = columns
        self.rows = rows
    }
    
    func moveToBasket(toRow: Int) {
        //TODO: 중복 Doll 지워야함
    }
    
}
