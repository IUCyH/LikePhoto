//
//  LinkedList.swift
//  SNS_Practice
//
//  Created by Jaemin Hong on 10/28/24.
// 

import Foundation

struct LinkedList<T> {
    private var head: Node<T>? = nil
    private var tail: Node<T>? = nil
    private var _count: Int = 0
    
    var isEmpty: Bool { head == nil }
    var count: Int { _count }
    
    mutating func append(_ value: T) {
        let node = Node(value: value)
        
        if isEmpty {
            head = node
        } else {
            tail!.next = node
        }
        
        tail = node
        _count += 1
    }
    
    mutating func delete(_ index: Int) -> T? {
        guard index >= 0 && index < count else { return nil }
        
        var prev: Node<T>? = nil
        var deletedNode: Node<T>? = head
        
        for _ in 0 ..< index {
            prev = deletedNode
            deletedNode = deletedNode?.next
        }
        
        guard let deletedNode else { return nil }
        
        if let prev {
            prev.next = deletedNode.next
        }
        
        if deletedNode == head {
            head = deletedNode.next
        }
        
        if deletedNode == tail {
            tail = prev
        }
        
        _count -= 1
        return deletedNode.value
    }
    
    mutating func get(_ index: Int) -> T? {
        guard index >= 0 && index < count else { return nil }
        
        var targetNode: Node<T>? = head
        
        for _ in 0 ..< index {
            targetNode = targetNode?.next
        }
        
        guard let targetNode else { return nil }
        
        return targetNode.value
    }
}
