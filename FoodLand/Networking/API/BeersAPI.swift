//
//  BeersAPI.swift
//  FoodLand
//
//  Created by Sergio Veliz on 3/16/20.
//  Copyright © 2020 Sergio Veliz. All rights reserved.
//

import Foundation

enum NetworkEnvironment {
    case production
}

public enum BeersApi {
    case beers(page: Int)
    case beerRandom
}

extension BeersApi: EndPointType {
    
    var environmentBaseURL : String {
        switch NetworkManager.environment {
            case .production: return Constants.ProductionServer.baseURL
        }
    }
    
    var baseURL: URL {
        guard let url = URL(string: environmentBaseURL) else { fatalError("baseURL could not be configured.")}
        return url
    }
    
    var path: String {
        switch self {
            case . beers:
            return "beers"
            case .beerRandom:
            return "beers/random"
        }
    }
    
    var httpMethod: HTTPMethod {
        return .get
    }
    
    var task: HTTPTask {
        switch self {
        case .beers(let page):
            return .requestParameters(bodyParameters: nil,
                                      bodyEncoding: .urlEncoding,
                                      urlParameters: ["page":page,
                                                      "per_page": 10])
            case .beerRandom:
                return .requestParameters(bodyParameters: nil, bodyEncoding: .urlEncoding, urlParameters: nil)
        }
    }
    
    var headers: HTTPHeaders? {
        return nil
    }
}


