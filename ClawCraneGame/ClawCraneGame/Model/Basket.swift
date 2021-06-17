//
//  Basket.swift
//  ClawCraneGame
//
//  Created by 배지영 on 2021/06/17.
//

import Foundation

class Basket {
    private var _dolls: [Doll] = []
    private var _disappearDolls: [Doll] = []
    
    var dolls: [Doll] {
        return _dolls
    }
    
    var score: Int {
        _disappearDolls.reduce(0) { $0.ty }
    }
    
    func append(doll: Doll) -> Int {
        if _dolls.last?.value == doll.value {
            _disappearDolls.append(_dolls.removeLast())
        } else {
            _dolls.append(doll)
        }
    }
}
