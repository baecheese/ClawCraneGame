//
//  Doll.swift
//  ClawCraneGame
//
//  Created by 배지영 on 2021/06/16.
//

import Foundation

class Doll {
    
    private var rowIndex: Int
    private var columnIndex: Int
    var value: Int
    
    init(rowIndex: Int = -1, columnIndex: Int = -1, value: Int) {
        self.rowIndex = rowIndex
        self.columnIndex = columnIndex
        self.value = value
    }
    
    func update(rowIndex: Int) {
        self.rowIndex = rowIndex
    }
    
    func update(columnIndex: Int) {
        self.columnIndex = columnIndex
    }
    
    func move() {
        self.rowIndex = -1
        self.columnIndex = -1
    }
    
}
