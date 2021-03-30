//
//  Request.swift
//  iOS 1st mindera test
//
//  Created by Stefan V. de Moraes on 27/03/21.
//

import Foundation


import UIKit

class Request: NSMutableURLRequest {
    
    enum Method: String {
        case GET
        case POST
        case PUT
        case PATCH
    }
    
    convenience init?(requestMethod: Method, urlString: String, bodyParams: [String: Any]? = nil) {
        
        guard let url =  URL.init(string: urlString) else { return nil }
        
        self.init(url: url)
        self.httpMethod = requestMethod.rawValue
        self.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        if let bodyParams = bodyParams {
            let body = try? JSONSerialization.data(withJSONObject: bodyParams, options: .prettyPrinted)
            self.httpBody = body
        } 
    }
}
