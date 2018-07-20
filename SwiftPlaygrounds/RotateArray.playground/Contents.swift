//: Playground - noun: a place where people can play

func rotate(_ nums: inout [Int], _ k: Int) {
    var k = k % nums.count
    if k < 0 {
        k = k + nums.count
    }
    reverseArray(&nums, start: 0, end: nums.count - 1)
    reverseArray(&nums, start: 0, end: k - 1)
    reverseArray(&nums, start: k, end: nums.count - 1)
}

func reverseArray(_ nums: inout [Int], start: Int, end: Int) {
    var start = start
    var end = end
    while start < end {
        nums.swapAt(start, end)
        start += 1
        end -= 1
    }
}

import XCTest

class TestRotatedArray: XCTestCase {
    func testLeetCodeExample() {
        var array = [1,2,3,4,5,6,7]
        rotate(&array, 3)
        XCTAssertEqual(array, [5,6,7,1,2,3,4])
    }
    func testLargeRotation() {
        var array = [-1]
        rotate(&array, 2)
        XCTAssertEqual(array, [-1])
    }
}

TestRotatedArray.defaultTestSuite.run()
