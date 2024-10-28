//
//  Node.swift
//  SNS_Practice
//
//  Created by Jaemin Hong on 10/28/24.
// 

import Foundation

final class Node<T: AnyObject>: Equatable {

    weak var value: T?
    var next: Node?
    
    init(value: T, next: Node? = nil) {
        self.value = value
        self.next = next
    }
    
    static func == (lhs: Node<T>, rhs: Node<T>) -> Bool {
        ObjectIdentifier(lhs) == ObjectIdentifier(rhs)
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(ObjectIdentifier(self))
    }
}
