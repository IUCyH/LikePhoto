//
//  DataManageable.swift
//  SNS_Practice
//
//  Created by Jaemin Hong on 10/28/24.
// 

import Foundation

protocol DataManageable {
    init()
    func fetch(with: RequestType, _ parameter: GetParameter) async throws -> GetResult
    func update(with: RequestType)
}
