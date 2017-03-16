//
//  APIRouter.swift
//  Starter - iOS
//
//  Created by Arun Jangid on 1/18/17.
//  Copyright © 2017 Arun Jangid. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper

enum APIRouter:URLRequestConvertible {
    case loginUser(params: Parameters)
    case registerUser(parameters: Parameters)
    case fetchPolicy(parmeters:Parameters)
    case updateUser(username: String, parameters: Parameters)
    case destroyUser(username: String)
    case sendSignature(params:Parameters)
    
    static let baseURLString = "http://localhost:8888"
    
    var method: HTTPMethod {
        switch self {
        case .loginUser:
            return .post
        case .registerUser:
            return .post
        case .fetchPolicy:
            return .post
        case .updateUser:
            return .put
        case .destroyUser:
            return .delete
        case .sendSignature:
            return .post
        }
    }
    
    var path: String {
        switch self {
        case .loginUser:
            return "/auth/login"
        case .registerUser:
            return "/user/register"
        case .fetchPolicy:
            return "/policy/fetch_policy"
        case .updateUser(let username, _):
            return "/users/\(username)"
        case .destroyUser(let username):
            return "/users/\(username)"
        case .sendSignature:
            return "/user/send_signature"
        }
    }
    
    // MARK: URLRequestConvertible
    
    func asURLRequest() throws -> URLRequest {
        let url = try APIRouter.baseURLString.asURL()
        
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        urlRequest.httpMethod = method.rawValue
        

        
        switch self {
        case .loginUser(let params):
           let user = params["username"] as! String
           let pwd = params["password"] as! String
           
        urlRequest.addValue(String.getBasicAuthorizationFor(user, password: pwd), forHTTPHeaderField: "Authorization")
            
            urlRequest = try URLEncoding.default.encode(urlRequest, with: nil)
        case .registerUser(let parameters):
            urlRequest = try URLEncoding.default.encode(urlRequest, with: parameters)
        case .updateUser(_, let parameters):
            urlRequest = try URLEncoding.default.encode(urlRequest, with: parameters)
        case .fetchPolicy(let parmeters):
            urlRequest.addValue((PIVCManager.sharedInstance.currentUser?.authString)!, forHTTPHeaderField: "authString")
            urlRequest = try URLEncoding.default.encode(urlRequest, with: parmeters)
        case .sendSignature(let params):
            urlRequest.addValue((PIVCManager.sharedInstance.currentUser?.authString)!, forHTTPHeaderField: "authString")
            urlRequest = try URLEncoding.default.encode(urlRequest, with: params)
        default:
            break
        }
        
        return urlRequest
    }
}
