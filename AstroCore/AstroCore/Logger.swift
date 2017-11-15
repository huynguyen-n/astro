//
//  Logger.swift
//  AstroCore
//
//  Created by Huy Nguyen on 11/15/17.
//  Copyright © 2017 Huy Nguyen. All rights reserved.
//

import Foundation
import SwiftyBeaver

class Log: NSObject {
    
    let log = SwiftyBeaver.self
    
    /// Share instance
    static let shareInstance = Log()
    
    override init() {
        super.init()
        
        /// Log console
        let console = ConsoleDestination()
        console.asynchronously = true
        self.log.addDestination(console)
    }
    
    
    /// MARK: - Public
    func error(_ error: Any,_ fileName: String,_ functionName: String,_ line: Int) {
        self.log.error(error, fileName, functionName, line: line)
    }
    
    func warning(_ warning: Any,_ file: String,_ function: String,_ line: Int) {
        self.log.warning(warning)
    }
    
    func debug(_ debug: Any,_ file: String,_ function: String,_ line: Int) {
        self.log.debug(debug)
    }
    
    func info(_ info: Any,_ file: String,_ function: String,_ line: Int) {
        self.log.info(info, file, function, line: line)
    }
    
    func verbose(_ verbose: Any,_ file: String,_ function: String,_ line: Int) {
        self.log.verbose(verbose)
    }
}

public class Logger {
    
    class func initLogger() {
        _ = Log.shareInstance
    }
    
    public class func error(_ error: Any,
                            toSlack: Bool = true,
                            fileName: String = #file,
                            functionName: String = #function,
                            line: Int = #line) {
        // Console
        Log.shareInstance.error(error, fileName, functionName, line)
    }
    
    public class func warning(_ warning: Any,
                              _ file: String = #file,
                              _ function: String = #function,
                              _ line: Int = #line) {
        Log.shareInstance.warning(warning, file, function, line)
    }
    
    public class func debug(_ debug: Any,
                            _ file: String = #file,
                            _ function: String = #function,
                            _ line: Int = #line) {
        Log.shareInstance.debug(debug, file, function, line)
    }
    
    public class func info(_ info: Any,
                            _ file: String = #file,
                            _ function: String = #function,
                            _ line: Int = #line) {
        Log.shareInstance.info(info, file, function, line)
    }
    
    public class func verbose(_ verbose: Any,
                              _ file: String = #file,
                              _ function: String = #function,
                              _ line: Int = #line) {
        Log.shareInstance.verbose(verbose, file, function, line)
    }
}















