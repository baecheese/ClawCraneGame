//
//  Space.swift
//  ClawCraneGame
//
//  Created by 배지영 on 2021/06/16.
//

import UIKit

class Space {
    
    enum SpaceType {
        case inBoard
        case inBasket
        
        var backgroundImage: UIImage? {
            switch self {
            case .inBoard:
                return UIImage(named: "icon_wall")
            case .inBasket:
                return UIImage(named: "icon_green")
            }
        }
    }
    
    enum State {
        case empty
        case fill(image: UIImage?)
        case bomb
        
        var icon: UIImage? {
            switch self {
            case .empty:
                return nil
            case .fill:
                return nil
            case .bomb:
                return UIImage(named: "icon_bomb")
            }
        }
    }
    
    private var _rowIndex: Int
    private var _columnIndex: Int
    
    let type: SpaceType
    var doll: Doll? = nil
    
    var description: String {
        return "\((doll?.type.consolIcon) ?? "⬛️")"
    }
    
    var position: (column: Int, row: Int) {
        return (column: _columnIndex, row: _rowIndex)
    }
    
    var isEmpty: Bool {
        return nil == doll
    }
    
    init(rowIndex: Int, columnIndex: Int, doll: Doll?, in type: SpaceType) {
        self._rowIndex = rowIndex
        self._columnIndex = columnIndex
        self.doll = doll
        self.type = type
    }
    
    func pop() -> Doll? {
        let doll = self.doll
        doll?.update(.outSpace)
        self.doll = nil
        return doll
    }
    
}


extension Space: Equatable {
    
    static func == (lhs: Space, rhs: Space) -> Bool {
        return lhs.position.row == rhs.position.row
            && lhs.position.column == rhs.position.column
            && lhs.doll == rhs.doll
    }
    
    
}
