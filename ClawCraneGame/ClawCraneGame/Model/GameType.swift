//
//  GameType.swift
//  ClawCraneGame
//
//  Created by 배지영 on 2021/06/17.
//

import Foundation

class GameType {
    
    // board 배열은 2차원 배열로 크기는 "5 x 5" 이상 "30 x 30" 이하입니다.
    let min: Int = 5
    let max: Int = 30
    
    // 한 라인의 칸 수
    var lineCount: Int
    
    static var shared: GameType {
        return GameType()
    }
    
    private init() {
        lineCount = min // default
    }
    
    var displayText: String {
        return "\(lineCount) x \(lineCount)"
    }
    
    @discardableResult
    func increase() -> Int {
        guard min <= lineCount && lineCount < max else { return lineCount }
        lineCount += 1
        return lineCount
    }
    
    @discardableResult
    func decrease() -> Int {
        guard min < lineCount && lineCount <= max else { return lineCount }
        lineCount -= 1
        return lineCount
    }
    
    func random() -> Board {
        return Board([
            [0,0,0,0,0],
            [0,0,1,0,3],
            [0,2,5,0,1],
            [4,2,4,4,2],
            [3,5,1,3,1]
        ])
    }
    
}
