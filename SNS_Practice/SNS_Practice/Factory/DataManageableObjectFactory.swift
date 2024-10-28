//
//  DataManageableObjectFactory.swift
//  SNS_Practice
//
//  Created by Jaemin Hong on 10/28/24.
// 

import Foundation

final class DataManageableObjectFactory<T: DataManageable> {
    
    private var instances: Queue<T> = Queue()
    private let maxReferenceCount: Int
    
    init(maxReferenceCount: Int) {
        self.maxReferenceCount = maxReferenceCount
    }
    
    func getInstance() -> T? {
        if instances.count < maxReferenceCount {
            let instance = T()
            instances.push(instance)
        }
        
        return instances.peek()
    }
}
