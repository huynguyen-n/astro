//
//  Request+Error.swift
//  AstroCore
//
//  Created by Huy Nguyen on 11/14/17.
//  Copyright © 2017 Huy Nguyen. All rights reserved.
//

import Alamofire
import Foundation
import RxSwift

// MARK: - Error Hanlding
extension Request {
    
    func handleValidation(_ response: DataResponse<Any>?) -> NSError? {
        
        // No Response
        guard let innerResponse = response?.response else {
            return NSError.jsonMapperError()
        }
        
        // Default status code
        let statusCode = innerResponse.statusCode
        
        if 200...300 ~= statusCode {
            return nil
        }
        
        return NSError.astroError(data: response?.result.value, code: statusCode)
    }
}

