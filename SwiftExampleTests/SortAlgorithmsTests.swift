//
//  SortAlgorithmsTests.swift
//  RACPlayAround
//
//  Created by RonnieRen on 8/18/15.
//  Copyright © 2016 RonnieRen. All rights reserved.
//

import Foundation
import XCTest

class Node<T: Any> {
    let value: T
    var left: Node?
    var right: Node?
    init(value: T, left: Node? = nil, right: Node? = nil) {
        self.value = value
        self.left = left
        self.right = right
    }

}


class SortAlgorithmTests: XCTestCase {

    let array = [3, 7, 19, 34, 22, 9, 0, 1, 1, 1, 1, 1, 1, 2, 2, 2, 2, 2, 2, 2, 45, 10, 32, 05, 27, 48, 90, 12, 42]
    var a: [Int] = []

    func insertionSort<T where T: Comparable >(inout a: [T], start: Int, step: Int) {

        for i in start.stride(to: a.count, by: step) {
            for j in (i+step).stride(to: a.count, by: step) {
                if a[i] > a[j] {
                    swap(&a[i], &a[j])
                }
            }
        }
    }

    override func setUp() {
        super.setUp()
        self.a = self.array
    }

    override func tearDown() {
        super.tearDown()
        print("original array is:  \(array) ")
        print("sorted array is:    \(a) ")

    }


    func testInsertSorting() {
        self.insertionSort(&a, start: 0, step:1)
    }


    func testShellSorting() {
        var step = a.count/2
        while step >= 1 {
            insertionSort(&a, start: 0, step: step)
            step /= 2
        }
    }


    func testSimpleSectionSorting() {
        for i in 0..<a.count {
            var min = i
            for j in i+1..<a.count {
                if a[j] < a[min] {
                    min = j
                }
            }
            if min != i {
                swap(&a[i], &a[min])
            }
        }
    }

    func testSimpleSectionSorting_Improved() {
        for i in 0...(a.count/2) {
            var min = i, max = i
            for j in i+1..<(a.count-i) {
                if a[j] < a[min] {
                    min = j
                }
                if a[j] >= a[max] {
                    max = j
                }
            }
            if min != i {
                swap(&a[i], &a[min])
                if max == i {
                    max = min
                }
            }
            if max != (a.count - i - 1) {
                swap(&a[max], &a[a.count - i - 1])
            }
        }

    }


    func testBubbleSorting() {
        for i in 0..<(a.count-1) {
            for j in 0..<(a.count - 1 - i) {
                if a[j] >= a[j+1] {
                    swap(&a[j], &a[j+1])
                }
            }
        }
    }



//    func buildBinaryTreeFromArray(list: [Int], inout index: Int, node: Node<Int> ) {
//        if index >= list.count {
//            return
//        }
//
//        let aNode = Node(value: list[index])
//        node.left = aNode
//
//        index += 1
//        if index < list.count {
//            node.right = Node(value: list[index])
//            index += 1
//        }
//    }

    func buildBinaryTreeFromArray<T: Any>(list: [T]) -> Node<T>? {

        if list.isEmpty {
            return nil
        }

        var i = 0
        let root = Node(value: list[i])
        var nodes = [root]
        i += 1
        while i < list.count {
            let nodeList = nodes
            nodes = []
            for aNode in nodeList {
                let node = Node(value: list[i])
                aNode.left = node
                nodes += [node]
                i += 1
                if i < list.count {
                    let node = Node(value: list[i])
                    aNode.right = node
                    nodes += [node]
                }
            }
        }
        return root
    }



    func testHeapSorting() {

    }



}
