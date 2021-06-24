//
//  Doll.swift
//  ClawCraneGame
//
//  Created by 배지영 on 2021/06/16.
//

import UIKit

class Doll {
    
    enum State {
        case inSpace
        case outSpace
        case inBasket
        case hiddenBasket
    }
    
    enum DollType: Int {
        case apple = 1
        case heart = 2
        case potion = 3
        case star = 4
        case sword = 5
        
        var consolIcon: String {
            switch self {
                case .apple:
                    return "🍎"
                case .heart:
                    return "🍐"
                case .potion:
                    return "🍑"
                case .star:
                    return "🍈"
                case .sword:
                    return "🍋"
            }
        }
        
        var icon: UIImage? {
            switch self {
                case .apple:
                    return UIImage(named: "icon_apple")
                case .heart:
                    return UIImage(named: "icon_heart")
                case .potion:
                    return UIImage(named: "icon_potion")
                case .star:
                    return UIImage(named: "icon_star")
                case .sword:
                    return UIImage(named: "icon_sword")
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
