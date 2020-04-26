//
//  NetworkManager.swift
//  FoodLand
//
//  Created by Sergio Veliz on 3/16/20.
//  Copyright © 2020 Sergio Veliz. All rights reserved.
//

import Foundation

enum ResponseError: Error {
    case authoriseError
    case badRequest
    case failed
    case noData
    case unableToDecode
    case noConnection
}

class NetworkManager {
    static let environment : NetworkEnvironment = .production
    static let apiKey = ""
    let router = Router<BeersApi>()
    
    let networkMonitor = NetworkConnectionMonitor()
    
    func getBeersList(page: Int, completion: @escaping (_ beers: [BeersModelElement]?,_ error: ResponseError?)->()){
        router.request(.beers(page: page)) { data, response, error in
            
            if error != nil {
                completion(nil, .noConnection)
            }
            if let response = response as? HTTPURLResponse {
                let result = self.handleNetworkResponse(response)
                switch result {
                case .success:
                    guard let responseData = data else {
                        completion(nil, .noData)
                        return
                    }
                    do {
                        print(responseData)
                        let jsonData = try JSONSerialization.jsonObject(with: responseData, options: .mutableContainers)
                        print(jsonData)
                        let apiResponse = try JSONDecoder().decode([BeersModelElement].self, from: responseData)
                        DispatchQueue.main.async {
                            completion(apiResponse,nil)
                        }
                    } catch {
                        print(error)
                        DispatchQueue.main.async {
                            completion(nil, .unableToDecode)
                        }
                    }
                    
                case .failure:
                    completion(nil, .failed)
                }
            }
            
            
        }
    }
    
    func getBeerRandom(completion: @escaping (_ beers: [BeersModelElement]?,_ error: ResponseError?)->()){
        router.request(.beerRandom) { data, response, error in
            
            if error != nil {
                completion(nil, .noConnection)
            }
            
            if let response = response as? HTTPURLResponse {
                let result = self.handleNetworkResponse(response)
                switch result {
                case .success:
                    guard let responseData = data else {
                        completion(nil, .noData)
                        return
                    }
                    do {
                        print(responseData)
                        let jsonData = try JSONSerialization.jsonObject(with: responseData, options: .mutableContainers)
                        print(jsonData)
                        let apiResponse = try JSONDecoder().decode([BeersModelElement].self, from: responseData)
                        completion(apiResponse,nil)
                    }catch {
                        print(error)
                        completion(nil, .unableToDecode)
                    }
                case .failure:
                    completion(nil, .failed)
                }
            }
        }
    }
    
    fileprivate func handleNetworkResponse(_ response: HTTPURLResponse) -> Result<Data, ResponseError> {
        
        switch response.statusCode {
        case 200...299: return .success(Data())
        case 401...500: return .failure(.authoriseError)
        case 501...599: return .failure(.badRequest)
        default: return .failure(.failed)
        }
    }
}
