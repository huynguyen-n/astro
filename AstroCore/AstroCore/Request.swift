//
//  Request.swift
//  AstroCore
//
//  Created by Huy Nguyen on 11/14/17.
//  Copyright © 2017 Huy Nguyen. All rights reserved.
//

import Alamofire
import Foundation
import RxSwift

typealias HeaderParameter = [String: String]
typealias JSONDictionary = [String: Any]

/// MARK: - Request Protocol
protocol Request: URLRequestConvertible {
    
    associatedtype Element
    
    var basePath: String { get }
    
    var endpoint: String { get }
    
    var httpMethod: HTTPMethod { get }
    
    var param: Parameter? { get }
    
    var addionalHeader: HeaderParameter? { get }
    
    var isAuthenticated: Bool { get }
    
    func decode(data: Any) throws -> Element?
}
