//
//  Constants.swift
//  FoodLand
//
//  Created by Sergio Veliz on 3/9/20.
//  Copyright © 2020 Sergio Veliz. All rights reserved.
//

import Foundation


struct Constants {
    
    static let noConnection = "NoConnection"
    
    struct TabBarImageName {
        static let main = "triangle"
        static let menu = "app"
        static let about = "circle"
        static let beers = "hexagon"
    }
    
    struct TabBarTitle {
        static let main = "Home"
        static let menu = "Menu"
        static let about = "About"
        static let beers = "Beers"
    }
    
    struct ProductionServer {
        static let baseURL = "https://api.punkapi.com/v2/"
    }
    
    struct APIParameterKey {
        static let page = "page"
        static let perPage = "per_page"
    }
    
    enum HTTPHeaderField: String {
        case authentication = "Authorization"
        case contentType = "Content-Type"
        case acceptType = "Accept"
        case acceptEncoding = "Accept-Encoding"
    }
    
    enum ContentType: String {
        case json = "application/json"
    }
    
    static let timeFormat = "HH:mm"
    
    struct KeysApp {
        static let scheduleForDarkMode = "k_schedule_for_dark_mode"
        static let fromTime = "k_fromTime"
        static let toTime = "k_toTime"
    }
    
}
