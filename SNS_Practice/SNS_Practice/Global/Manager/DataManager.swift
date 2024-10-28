//
//  DataManager.swift
//  SNS_Practice
//
//  Created by Jaemin Hong on 10/5/24.
// 

import Foundation

final class DataManager: DataManageable {

    static func == (lhs: DataManager, rhs: DataManager) -> Bool {
        ObjectIdentifier(lhs) == ObjectIdentifier(rhs)
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(ObjectIdentifier(self))
    }
    
    func fetch(with type: RequestType, _ parameter: GetParameter) async throws -> GetResult {
        do {
            let result = try await LikeServer.shared.get(type, parameter: parameter)
            
            return result
        } catch {
            print("Error in fetch: \(error)")
            throw error
        }
    }
    
    func update(with: RequestType) {
        
    }
}
