//
//  Doll.swift
//  ClawCraneGame
//
//  Created by 배지영 on 2021/06/16.
//

import Foundation

class Doll {
    
    private var _value: Int
    
    var value: Int {
        return _value
    }
    
    // TODO: 캐릭터 이름
    //    enum Type {
    //        case
    //    }
    
    init(value: Int) {
        self._value = value
    }
    
}

extension Doll: Equatable {
    
    static func == (lhs: Doll, rhs: Doll) -> Bool {
        return lhs.value == rhs.value
    }
    
    
}
