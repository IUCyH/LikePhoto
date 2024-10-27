//
//  DataManager.swift
//  SNS_Practice
//
//  Created by Jaemin Hong on 10/5/24.
// 

import Foundation

final class DataManager {
    
    /// The Parameter is just for test. will change
    func getUser(id: Int) async throws -> User? {
        var user: User? = nil
        
        do {
            let result = try await LikeServer.shared.get(.users, parameter: .userWithID(id: "\(id)"))
            
            if case GetResult.user(let result) = result {
                user = result
            }
        } catch {
            print("Error in getUser: \(error)")
            throw error
        }
        
        return user
    }
}