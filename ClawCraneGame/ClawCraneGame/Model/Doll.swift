//
//  Doll.swift
//  ClawCraneGame
//
//  Created by 배지영 on 2021/06/16.
//

import Foundation

class Doll {
    
    private var _rowIndex: Int
    private var _columnIndex: Int
    private var _value: Int
    
    var rowIndex: Int {
        return _rowIndex
    }
    
    var columnIndex: Int {
        return _columnIndex
    }
    
    var value: Int {
        return _value
    }
    
    // TODO: 캐릭터 이름
    //    enum Type {
    //        case
    //    }
    
    init(rowIndex: Int = -1, columnIndex: Int = -1, value: Int) {
        self._rowIndex = rowIndex
        self._columnIndex = columnIndex
        self._value = value
    }
    
    func update(rowIndex: Int) {
        self._rowIndex = rowIndex
    }
    
    func update(columnIndex: Int) {
        self._columnIndex = columnIndex
    }
    
    func move() {
        self._rowIndex = -1
        self._columnIndex = -1
    }
    
}

extension Doll: Equatable {
    
    static func == (lhs: Doll, rhs: Doll) -> Bool {
        return lhs.rowIndex == rhs.rowIndex
            && lhs.columnIndex == rhs.columnIndex
            && lhs.value == rhs.value
    }
    
    
}
