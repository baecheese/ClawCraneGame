//
//  Board.swift
//  ClawCraneGame
//
//  Created by 배지영 on 2021/06/16.
//

import Foundation

class Board {
    
    enum BoardError: Error {
        case invaildSpace
        case invalidLength
        case emptyDoll
    }
    
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
    
    var basket: Basket {
        return _basket
    }
    
    var score: Int {
        return _basket.score
    }
    
    var description: String {
        var log: String = "[Board]\n"
        for row in rows {
            for space in row {
                log += space.description
            }
            log += "\n"
        }
        let basket: String = "[Basket]\n\(_basket.description)"
        return log + basket
    }
    
    init(_ board: [[Int]]) {
        // board 배열은 2차원 배열로 크기는 "5 x 5" 이상 "30 x 30" 이하입니다.
        var columns: [[Space]] = []
        var rows: [[Space]] = []
        for rowIndex in 0...board.count-1 {
            var row: [Space] = []
            for columnIndex in 0...board[rowIndex].count - 1 {
                let doll = Doll(value: board[rowIndex][columnIndex])
                let space = Space(rowIndex: rowIndex, columnIndex: columnIndex, doll: doll)
                // row cache
                row.append(space)
                // column cache
                if columns.indices.contains(columnIndex) {
                    columns[columnIndex].append(space)
                } else {
                    columns.append([space])
                }
            }
            rows.append(row)
        }
        
        self._columns = columns
        self._rows = rows
        self._basket = Basket(length: columns.count)
    }
    
    /// "toColumn" is number. number start 1. not index.
    func lastToFillSpace(columnNumber: Int) -> Space? {
        guard 0 < columnNumber, let index = lastIndexToFillSpace(columnNumber: columnNumber) else { return nil }
        return columns[columnNumber - 1][index]
    }
    
    func lastIndexToFillSpace(columnNumber: Int) -> Int? {
        let columnIndex = columnNumber - 1
        let currentColumn = columns[columnIndex]
        for index in 0...currentColumn.count - 1 {
            guard false == currentColumn[index].isEmpty else { continue }
            return index
        }
        return nil
    }
    
    func lastDollToBoard(columnNumber: Int) -> Doll? {
        guard 0 < columnNumber,
              columns.indices.contains(columnNumber - 1),
              let index = lastIndexToFillSpace(columnNumber: columnNumber),
              columns[columnNumber - 1].indices.contains(index) else {
            return nil
        }
        return columns[columnNumber - 1][index].doll
    }
    
    @discardableResult
    func popLastDollToBoard(columnNumber: Int) throws -> Doll {
        guard 0 < columnNumber,
              let index = lastIndexToFillSpace(columnNumber: columnNumber) else {
            throw BoardError.invalidLength
        }
        guard let lastDoll = columns[columnNumber - 1][index].pop() else {
            throw BoardError.emptyDoll
        }
        return lastDoll
    }
    
    func addBasketDoll(doll: Doll) throws {
        do {
            try _basket.add(doll: doll)
        } catch {
            throw error
        }
    }
}
