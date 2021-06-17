//
//  BoardTests.swift
//  ClawCraneGameTests
//
//  Created by 배지영 on 2021/06/16.
//

import XCTest
@testable import ClawCraneGame

class BoardTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    private let testData = [
        [0,0,0,0,0],
        [0,0,1,0,3],
        [0,2,5,0,1],
        [4,2,4,4,2],
        [3,5,1,3,1]
    ]

    func testBoardSetting() throws {
        let board = Board(testData)
        print(board.description)
        for row in 0...testData.count - 1 {
            for column in 0...testData[row].count - 1 {
                let doll_row = board.rows[row][column]
                let doll_column = board.columns[column][row]
                XCTAssertEqual(doll_row, doll_column)
            }
        }
    }
    
    func testMoveDoll() throws {
        let board = Board(testData)
        print(board.description)
        let moves = [1,5,3,5,1,2,1,4]
        var basket: [Doll] = []
        var score: Int = 0
        for columnNumber in moves {
            print("===== Pick Column Number \(columnNumber) ======")
            let lastDoll = board.lastToFillSapace(columnNumber: columnNumber)?.doll
            let doll = board.moveLastDollToBasket(columnNumber: columnNumber)
            print(board.description)
            XCTAssertEqual(lastDoll, doll)
            guard let _ = lastDoll else { continue }
            if basket.last == lastDoll {
                score += basket.removeLast().type.score
            } else {
                basket.append(lastDoll!)
            }
            XCTAssertEqual(score * 2, board.score)
        }
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
