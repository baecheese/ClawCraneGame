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
        return (_disappearDolls.reduce(0, { $0 + $1.type.score })) * 2
    }
    
    var description: String {
        return "dolls : \(dolls.map { $0.type.icon })\ndisappearDolls: \(_disappearDolls.map { return $0.type.icon })\nscore: \(score)"
    }
    
    func add(doll: Doll) {
        if _dolls.last == doll {
            _disappearDolls.append(_dolls.removeLast())
            _disappearDolls.last?.update(.hiddenBasket)
        } else {
            _dolls.append(doll)
            _dolls.last?.update(.inBasket)
        }
    }
}
