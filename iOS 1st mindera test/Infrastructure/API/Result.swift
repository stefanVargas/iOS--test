//
//  Result.swift
//  iOS 1st mindera test
//
//  Created by Stefan V. de Moraes on 27/03/21.
//

import Foundation

enum Result<ModelObject> {
    case success(ModelObject)
    case failure(String)
    case error(String)
}
