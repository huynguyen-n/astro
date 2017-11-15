//
//  NSError.swift
//  AstroCore
//
//  Created by Huy Nguyen on 11/15/17.
//  Copyright © 2017 Huy Nguyen. All rights reserved.
//

import Foundation

extension NSError {
    
    // Custom message
    static func customMessage(_ message: String) -> NSError {
        let userInfo = [NSLocalizedDescriptionKey: message]
        return NSError(domain: "com.astro.defaultError", code: 999, userInfo: userInfo)
    }
    
    // Unknow message
    static func unknowError() -> NSError {
        let userInfo = [NSLocalizedDescriptionKey: "Unknow error"]
        return NSError(domain: "com.astro.defaultError", code: 999, userInfo: userInfo)
    }
    
    // Unknow message
    static func jsonMapperError() -> NSError {
        let userInfo = [NSLocalizedDescriptionKey: "JSON Mapper error"]
        return NSError(domain: "com.astro.defaultError", code: 999, userInfo: userInfo)
    }
    
    // Astro error message
    static func astroError(data: Any?, code: Int) -> NSError {
        
        guard let dictData = data as? [String: Any] else { return self.jsonMapperError() }
        
        // Incase Astro return many errors
        if let uberErrors = dictData["errors"] as? [[String: Any]] {
            guard let firstError = uberErrors.first else {
                return self.jsonMapperError()
            }
            return NSError(domain: "com.astro.defaultError", code: code, userInfo: firstError)
        }
        
        // Single Error
        return NSError(domain: "com.astro.defaultError", code: code, userInfo: dictData)
    }
}
