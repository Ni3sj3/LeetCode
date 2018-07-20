
extension Array where Element: Comparable {
    
    // Assumes user knows binarySearch requires an ordered array, with exception of pivot.
    // Runtime Complexity: O(logn) where n is length of array.
    // Memory Complexity O(1)

    func rotatedBinarySearch(for key: Element) -> Int {
        var left = 0
        var right = self.count - 1
        
        while left <= right {
            let index = left + (right - left) / 2
            if self[index] == key { return index }
            if self[left] < self[index] && key < self[index] && key >= self[left] {
                right = index - 1
            } else if self[right] > self[index] && key > self[index] && key <= self[right] {
                left = index + 1
            } else if self[left] > self[index] {
                right = index - 1
            } else if self[right] < self[index] {
                left = index + 1
            } else {
                return -1
            }
        }
        return -1
    }
    
}

import XCTest

class BinarySearchTests: XCTestCase {

    func testFindingEndpoints() {
        let array = [9,40,1000,-100,1,2,3]
        XCTAssertEqual(array.rotatedBinarySearch(for: -100), 3)
        XCTAssertEqual(array.rotatedBinarySearch(for: 1000), 2)
    }

    func testFindingMiddleValues() {
        let array = ["D","E","A","B","C"]
        XCTAssertEqual(array.rotatedBinarySearch(for: "C"), 4)
    }

    func testEducativeExample() {
        let array = [176,188,199,200,210,222,1,10,20,47,59,63,75,88,99,107,120,133,155,162]
        XCTAssertEqual(array.rotatedBinarySearch(for: 200), 3)
    }

    func testLeetcodeExample() {
        let array = [4,5,6,7,0,1,2]
        XCTAssertEqual(array.rotatedBinarySearch(for: 3),-1)
    }

}

BinarySearchTests.defaultTestSuite.run()
