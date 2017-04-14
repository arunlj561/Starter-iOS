//
//  Async.swift
//  Starter-iOS
//
//  Created by Arun Jangid on 4/13/17.
//  Copyright © 2017 Arun Jangid. All rights reserved.
//

import Foundation

typealias AsyncProcess = (_ done: (AnyObject?) -> ()) -> ()

func parallel(_ acyncProcesses: [AsyncProcess], completion: @escaping ([AnyObject?]) -> ()) {
    var results = [AnyObject?](repeating: nil, count: acyncProcesses.count)
    
    let group = DispatchGroup()
    for (i, acyncProcess) in acyncProcesses.enumerated() {
        group.enter()
        acyncProcess { result in
            results[i] = result
            group.leave()
        }
    }
    
    group.notify(queue: DispatchQueue.main) {
        completion(results)
    }
}

func threadOnMain(_ block: @escaping ()->()) {
    DispatchQueue.main.async(execute: block)
}

func threadOnBackground(_ name: String = "background", block: @escaping ()->()) {
    DispatchQueue(label: name, attributes: []).async(execute: block)
}
