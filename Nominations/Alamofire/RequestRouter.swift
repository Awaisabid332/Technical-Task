//
//  RequestRouter.swift
//  Nominations
//
//  Created by AWS Macbook on 23/10/2023.
//  Copyright © 2023 3 Sided Cube (UK) Ltd. All rights reserved.
//

import Foundation
import Alamofire


let BASE_URL = "https://cube-academy-api.cubeapis.com/api"

enum RequestRouter: URLRequestConvertible {
    
    case getNominations
    case getNominee
    case createNomination(params: NominatonModel)
    
    var baseURL: URL {
        return URL(string: BASE_URL)!
    }
    
    var endPoint: String {
        switch self {
        case .getNominations, .createNomination:
            return "/nomination"
        case .getNominee:
            return "/nominee"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .getNominations, .getNominee:
            return .get
        case .createNomination:
            return .post
        }
    }
    
    var parameters: Parameters {
        switch self {
        case .getNominations, .getNominee:
            return Parameters()
        case .createNomination(let param):
            var params = Parameters()
            params["nominee_id"] = param.nominee_id ?? ""
            params["reason"] = param.reason ?? ""
            params["process"] = param.process ?? ""
            return params
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        let url = baseURL.appendingPathComponent(endPoint)
        
        var request = URLRequest(url: url)
        request.method = method
        
        // Set the "Authorization" header with your authentication token
        request.setValue("Bearer \(KeychainManager.shared.getUserToken() ?? "")", forHTTPHeaderField: "Authorization")
        
        switch self {
        case .getNominations, .getNominee, .createNomination:
            request = try URLEncoding.default.encode(request, with: parameters)
        }
    
        return request
    }
}
