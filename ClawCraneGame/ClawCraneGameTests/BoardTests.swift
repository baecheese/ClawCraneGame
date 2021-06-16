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

    func testBoardSetting() throws {
        let testData = [
            [0,0,0,0,0],
            [0,0,1,0,3],
            [0,2,5,0,1],
            [4,2,4,4,2],
            [3,5,1,3,1]
        ]
        let board = Board(testData)
        for row in 0...testData.count - 1 {
            for column in 0...testData[row].count - 1 {
                let doll_row = board.rows[row][column]
                let doll_column = board.columns[column][row]
                XCTAssertEqual(doll_row, doll_column)
            }
        }
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
