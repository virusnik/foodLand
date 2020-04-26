//
//  NetworkConnectionMonitor.swift
//  FoodLand
//
//  Created by Sergio Veliz on 4/26/20.
//  Copyright © 2020 Sergio Veliz. All rights reserved.
//

import Foundation

import Network

class NetworkConnectionMonitor {
    
    private let pathMonitor: NWPathMonitor
    private(set) var isConnected: Bool = true
    
    init() {
        pathMonitor = NWPathMonitor()
        pathMonitor.pathUpdateHandler = { [weak self] (path) in
            DispatchQueue.main.async {
                self?.isConnected = path.status == .satisfied
            }
        }
        pathMonitor.start(queue: DispatchQueue(label: "Monitor"))
    }
}
