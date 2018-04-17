//
//  BonjourService.swift
//  RemoteMedia
//
//  Created by Dinesh Thangasamy on 2018-04-17.
//  Copyright © 2018 datatrix. All rights reserved.
//

import Foundation

enum BonjourServiceStatus {
    case running
    case stopped
    case starting
    case stopping
}

class BonjourService: NSObject {
    
    static let shared = BonjourService()
    // private prevents others from using the default '()' initializer for this class (== Singleton)
    private override init() {
        super.init()
    }
    
    var status: BonjourServiceStatus = .stopped
    
    func startService(_ completion: @escaping (_ completed: Bool, _ error: NSError?) -> Void) {
        self.status = .starting
        self.status = .running
        completion(true,nil)
    }
    
    func stopService(_ completion: @escaping (_ completed: Bool, _ error: NSError?) -> Void) {
        self.status = .stopping
        self.status = .stopped
        completion(true,nil)
    }
}
