//
//  Doll.swift
//  ClawCraneGame
//
//  Created by 배지영 on 2021/06/16.
//

import Foundation

class Doll {
    
    enum State {
        case inSpace
        case outSpace
        case inBasket
        case removed
    }
    
    enum DollType: Int {
        case apple = 1
        case pear = 2
        case peach = 3
        case melon = 4
        case lemon = 5
        
        var icon: String {
            switch self {
                case .apple:
                    return "🍎"
                case .pear:
                    return "🍐"
                case .peach:
                    return "🍑"
                case .melon:
                    return "🍈"
                case .lemon:
                    return "🍋"
            }
        }
        
        var number: Int {
            return self.rawValue
        }
        
        var score: Int {
            return 1
        }
    }
    
    private var _type: DollType
    private var _state: State = .inSpace
    
    var type: DollType {
        return _type
    }
    
    var state: State {
        return _state
    }
    
    init?(value: Int) {
        guard 0 < value else { return nil }
        self._type = DollType(rawValue: value)!
    }
    
    func update(_ state: State) {
        self._state = state
    }
    
}

extension Doll: Equatable {
    
    static func == (lhs: Doll, rhs: Doll) -> Bool {
        return lhs.type.number == rhs.type.number
    }
    
    
}
