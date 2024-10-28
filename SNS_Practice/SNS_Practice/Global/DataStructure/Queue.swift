//
//  Queue.swift
//  SNS_Practice
//
//  Created by Jaemin Hong on 10/28/24.
// 

import Foundation

struct Queue<T> {
    private var elements: LinkedList<T> = LinkedList()
    
    var isEmpty: Bool { elements.isEmpty }
    var count: Int { elements.count }
    
    mutating func push(_ element: T) {
        elements.append(element)
    }
    
    mutating func pop() -> T? {
        return elements.delete(0)
    }
    
    mutating func peek() -> T? {
        return elements.get(0)
    }
}
