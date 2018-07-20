
// Find smallest common number in 3 arrays

func findSmallestCommonNumber(in a1: [Int], a2: [Int], a3: [Int]) -> Int {
    var p1 = 0
    var p2 = 0
    var p3 = 0

    while p1 < a1.count && p2 < a2.count && p3 < a3.count {
        if a1[p1] == a2[p2] && a1[p1] == a3[p3] { return a1[p1] }
        let viableMin = max(a1[p1], a2[p2], a3[p3])
        if a1[p1] < viableMin {
            p1 += 1
        }
        if a2[p2] < viableMin {
            p2 += 1
        }
        if a3[p3] < viableMin {
            p3 += 1
        }
        
    }
    return -1
}

//findSmallestCommonNumber(in: [6,7,10,25,30,63,64], a2: [-1,4,5,6,7,8,50], a3: [1,6,10,14])

import XCTest

class TestFindSmallestCommonNumber: XCTestCase {
    
    func testAllIdentical() {
        let array = [3]
        XCTAssertEqual(findSmallestCommonNumber(in: array, a2: array, a3: array), 3)
    }
    
    func testEducativeExample() {
        let a1 = [6,7,10,25,30,63,64]
        let a2 = [-1,4,5,6,7,8,50]
        let a3 = [1,6,10,14]
        XCTAssertEqual(findSmallestCommonNumber(in: a1, a2: a2, a3: a3), 6)
    }
    
    func testNoCommonNumber() {
        let a1 = [1,2,3,4]
        let a2 = [5,6,7,8]
        let a3 = [9,10,11,12]
        XCTAssertEqual(findSmallestCommonNumber(in: a1, a2: a2, a3: a3), -1)
    }

    func testMaxCommonNumber() {
        let a1 = [1,2,3,4,100]
        let a2 = [5,6,7,8,100]
        let a3 = [9,10,11,12,100]
        XCTAssertEqual(findSmallestCommonNumber(in: a1, a2: a2, a3: a3), 100)
    }

}

TestFindSmallestCommonNumber.defaultTestSuite.run()
