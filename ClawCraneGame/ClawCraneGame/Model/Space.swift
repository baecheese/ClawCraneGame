//
//  Space.swift
//  ClawCraneGame
//
//  Created by 배지영 on 2021/06/16.
//

import Foundation

class Space {
    
    private var _rowIndex: Int
    private var _columnIndex: Int
    var doll: Doll? = nil
    
    var position: (row: Int, column: Int) {
        return (row: _rowIndex, column: _columnIndex)
    }
    
    init(rowIndex: Int, columnIndex: Int, doll: Doll?) {
        self._rowIndex = rowIndex
        self._columnIndex = columnIndex
        self.doll = 0 == doll?.value ? nil : doll
    }
    
}


extension Space: Equatable {
    
    static func == (lhs: Space, rhs: Space) -> Bool {
        return lhs.position.row == rhs.position.row
            && lhs.position.column == rhs.position.column
            && lhs.doll == rhs.doll
    }
    
    
}