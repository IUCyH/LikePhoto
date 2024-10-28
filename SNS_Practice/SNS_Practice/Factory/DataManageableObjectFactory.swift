//
//  DataManageableObjectFactory.swift
//  SNS_Practice
//
//  Created by Jaemin Hong on 10/28/24.
// 

import Foundation

final class DataManageableObjectFactory<T> where T: DataManageable, T: AnyObject {
    
    private var instances: Queue<T> = Queue()
    
    func getInstance() -> T {
        var instance = instances.peek()
        
        while(instance == nil && instances.count > 0) {
            _ = instances.pop()
            instance = instances.peek()
        }
        
        if instance == nil {
            instance = T()
            instances.push(instance!)
        }
        
        return instance!
    }
}
