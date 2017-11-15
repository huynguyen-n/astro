//
//  Request+Alamofire.swift
//  AstroCore
//
//  Created by Huy Nguyen on 11/14/17.
//  Copyright © 2017 Huy Nguyen. All rights reserved.
//

import Alamofire
import Foundation
import RxSwift

// MARK: - Conform URLConvertible from Alamofire
extension Request {
    func asURLRequest() throws -> URLRequest {
        return self.buildURLRequest()
    }
}

// MARK: - Builder
extension Request {
    
    fileprivate func buildURLRequest() -> URLRequest {
        
        /// Init
        var request = URLRequest(url: self.url)
        request.httpMethod = self.httpMethod.rawValue
        request.timeoutInterval = TimeInterval(10 * 1000)
        
        /// Encode param
        guard var finalRequest = try? self.parameterEncoding.encode(request, with: self.param?.toDictionary()) else {
            fatalError("Can't handle unknow request")
        }
        
        /// Add additional if need
        if let addionalHeaders = self.addionalHeader {
            for (key, value) in addionalHeaders {
                finalRequest.addValue(value, forHTTPHeaderField: key)
            }
        }
        
        return finalRequest
    }
}
