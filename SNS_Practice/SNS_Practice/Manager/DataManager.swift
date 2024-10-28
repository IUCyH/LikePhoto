//
//  DataManager.swift
//  SNS_Practice
//
//  Created by Jaemin Hong on 10/5/24.
// 

import Foundation

final class DataManager: DataManageable {
    
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
