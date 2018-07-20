
// Runtime Complexity O(n) where n is the size of array
// Memory Complexity O(w) where w is the size of window

class Deque {
    // TODO: - convention of facade
    var array: [Int?]
    private(set) var frontIndex = -1
    private(set) var rearIndex = -1
    var size: Int
    var isEmpty: Bool { return frontIndex == -1 && rearIndex == -1 }
    init(size: Int) {
        self.size = size
        array = Array(repeating: nil, count: size)
    }

    var rear: Int? {
        guard rearIndex >= 0 else { return nil }
        return array[rearIndex]
    }
    func enQueue(_ num: Int) {
        if (rearIndex + 1) % size == frontIndex { frontIndex = (frontIndex + 1) % size }
        if frontIndex < 0 { frontIndex = (rearIndex + 1) % size }
        rearIndex = (rearIndex + 1) % size
        array[rearIndex] = num
    }

    var front: Int? {
        guard frontIndex >= 0 else { return nil }
        return array[frontIndex]
    }
    func deQueueFront() -> Int? {
        guard frontIndex >= 0 else { return nil }
        let returnValue = array[frontIndex]
        array[frontIndex] = nil
        frontIndex = (frontIndex + 1) % size
        if array[frontIndex] == nil {
            frontIndex = -1
            rearIndex = -1
        }
        return returnValue
    }
    func deQueueBack() -> Int? {
        guard let returnValue = array[rearIndex] else { return nil }
        array[rearIndex] = nil
        rearIndex = ((rearIndex - 1) + size) % size
        if array[rearIndex] == nil {
            rearIndex = -1
            frontIndex = -1
        }
        return returnValue
    }

}

extension Deque: CustomDebugStringConvertible {

    var debugDescription: String {
        let frontDescription = front == nil ? "nil" : "\(front!)"
        let rearDescription = rear == nil ? "nil" : "\(rear!)"
        let arrayDescription = array.map { $0 == nil ? "nil" : "\($0!)" }
        return "FRONT: \(frontDescription), REAR: \(rearDescription), ARRAY: \(arrayDescription)"
    }

}

func findMaxSlidingWindow(array: [Int], windowSize: Int) -> (windowSize: Int, maximumsInSlidingWinow: [Int]) {
    guard array.count >= windowSize else { return (windowSize, []) }
    
    var window = Deque(size: windowSize)
    var results = [Int]()

    func appendFirstInWindowToResult() {
        print(window.isEmpty)
        print(window.frontIndex)
        print(window.rearIndex)
        print(window)
        guard let first = window.front else { return }
        results.append(array[first])
    }
    
    // find max of first window
    for i in 0..<windowSize {
        while !window.isEmpty, let last = window.rear, array[i] >= array[last] {
            window.deQueueBack()
        }
        window.enQueue(i)
    }
    appendFirstInWindowToResult()
    
    for i in windowSize..<array.count {
        while !window.isEmpty, let last = window.rear, array[i] >= array[last] {
            window.deQueueBack()
        }
        
        if !window.isEmpty, let first = window.front, first <= i - windowSize {
            window.deQueueFront()
        }
        
        window.enQueue(i)
        
        appendFirstInWindowToResult()
    }
    
    return (windowSize, results)
    
}

import XCTest

class TestMaximumInSlidingWindow: XCTestCase {

    let array = [1, 2, 3, 4, 3, 2, 1, 2, 5]

    func testWindowSize1() {
        let results = findMaxSlidingWindow(array: array, windowSize: 1)
        XCTAssertEqual(results.windowSize, 1)
        XCTAssertEqual(results.maximumsInSlidingWinow, array)
    }

    func testWindowSize3() {
        let results = findMaxSlidingWindow(array: array, windowSize: 3)
        XCTAssertEqual(results.windowSize, 3)
        XCTAssertEqual(results.maximumsInSlidingWinow, [3,4,4,4,3,2,5])
    }

    func testWindowSize4() {
        let results = findMaxSlidingWindow(array: array, windowSize: 4)
        XCTAssertEqual(results.windowSize, 4)
        XCTAssertEqual(results.maximumsInSlidingWinow, [4,4,4,4,3,5])
    }

    func testWindowSize5() {
        let results = findMaxSlidingWindow(array: array, windowSize: 5)
        XCTAssertEqual(results.windowSize, 5)
        XCTAssertEqual(results.maximumsInSlidingWinow, [4,4,4,4,5])
    }

    func testWindowSizeN() {
        let max = array.max()!
        let results = findMaxSlidingWindow(array: array, windowSize: array.count)
        XCTAssertEqual(results.windowSize, array.count)
        XCTAssertEqual(results.maximumsInSlidingWinow.first!, max)
    }

}

class TestDeque: XCTestCase {
    
    
    func testInitialization() {
        let size = 5
        let deque = Deque(size: size)
        XCTAssertEqual(deque.size, size)
        XCTAssertEqual(deque.array.count, size)
    }

    func testEnqueue() {
        let deque = Deque(size: 5)
        func assertFront(at index: Int, value: Int) {
            XCTAssertEqual(deque.frontIndex, index)
            XCTAssertEqual(deque.front!, value)
        }
        func enqueueAndAssertPosition(index: Int, value: Int) {
            deque.enQueue(value)
            XCTAssertEqual(deque.rear!, value)
            XCTAssertEqual(deque.rearIndex, index)
        }
        for i in 0..<5 {
            enqueueAndAssertPosition(index: i, value: i)
            assertFront(at: 0, value: 0)
        }
        for i in 5..<7 {
            enqueueAndAssertPosition(index: i % deque.size, value: i)
            assertFront(at: i % deque.size + 1, value: i - 4)
        }
    }

    func testDequeue() {
        let deque = Deque(size: 5)
        func load() {
            for i in 0..<5 {
                deque.enQueue(i)
            }
        }
        load()
        func assertDequeueBack(index: Int) {
            let originalFrontIndex = deque.frontIndex
            let back = deque.deQueueBack()!
            XCTAssertEqual(back, index)
            XCTAssertEqual(deque.rearIndex, index - 1)
            XCTAssertEqual(originalFrontIndex, deque.frontIndex)
            if index == 0 {
                XCTAssert(deque.isEmpty)
            }
        }
        for i in 0..<5 {
            assertDequeueBack(index: 4 - i)
        }
    }

}

TestMaximumInSlidingWindow.defaultTestSuite.run()
TestDeque.defaultTestSuite.run()
