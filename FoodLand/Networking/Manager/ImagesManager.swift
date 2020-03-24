//
//  ImagesManager.swift
//  FoodLand
//
//  Created by Sergio Veliz on 3/24/20.
//  Copyright © 2020 Sergio Veliz. All rights reserved.
//

import SwiftUI
import Combine

class ImagesManager: ObservableObject {
    
    public let objectWillChange = PassthroughSubject<Data,Never>()
    
    public private(set) var data = Data() {
        willSet {
            objectWillChange.send(newValue)
        }
    }
    
    private let resourseURL: URL?
    
    public init(resourseURL: URL?){
        self.resourseURL = resourseURL
    }
    
    public func loadImage() {
        guard let url = resourseURL else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data,_,_) in
            guard let data = data else {
                return
            }
            DispatchQueue.main.async {
                self.data = data
            }
        }   .resume()
    }
}
