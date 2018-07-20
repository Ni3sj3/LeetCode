
extension Array where Element: Comparable {

    // Assumes user knows binarySearch requires an ordered array.
    // Runtime Complexity: O(logn) where n is length of array.
    // Memory Complexity O(1)

    func binarySearch(for key: Element) -> Int {
        var left = 0
        var right = self.count - 1
        
        while left <= right {
            let index = left + (right - left) / 2
            if self[index] == key { return index }
            if self[index] < key {
                left = (index + 1)
            }
            if self[index] > key {
                right = (index - 1)
            }
        }
        return -1
    }

}

import XCTest

class BinarySearchTests: XCTestCase {

    func testFindingEndpoints() {
        let array = [-100,1,2,3,9,40,1000]
        XCTAssertEqual(array.binarySearch(for: -100), 0)
        XCTAssertEqual(array.binarySearch(for: 1000), 6)
    }

    func testFindingMiddleValues() {
        let array = ["A","B","C","D","E"]
        XCTAssertEqual(array.binarySearch(for: "C"), 2)
    }
    
}

BinarySearchTests.defaultTestSuite.run()
