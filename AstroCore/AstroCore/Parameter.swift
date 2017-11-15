//
//  Parameters.swift
//  AstroCore
//
//  Created by Huy Nguyen on 11/14/17.
//  Copyright © 2017 Huy Nguyen. All rights reserved.
//

import Foundation

/// MARK: - Generic param
protocol Parameter {
    
    /// Convert to diction work seemles Alamofire
    ///
    /// - Returns: Dictionary value
    func toDictionary() -> [String: Any]
}
