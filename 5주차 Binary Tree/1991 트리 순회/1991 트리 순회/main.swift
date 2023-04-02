//
//  main.swift
//  1991 트리 순회
//
//  Created by Jinah Park on 2023/02/08.
//
import Foundation

class BinaryNode<Element> {
    var value: Element
    var leftChild: BinaryNode?
    var rightChild: BinaryNode?
    
    init(value: Element, leftChild: BinaryNode? = nil, rightChild: BinaryNode? = nil) {
        self.value = value
        self.leftChild = leftChild
        self.rightChild = rightChild
    }
}

var nodeArray: [[String]] = []

let n = Int(readLine()!)!

for _ in 0...n-1 {
    nodeArray.append(readLine()!.components(separatedBy: " "))
}

print(nodeArray)
