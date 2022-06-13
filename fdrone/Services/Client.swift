//
//  Client.swift
//  fdrone
//
//  Created by Sean Hong on 2022/06/13.
//

import Foundation
import Alamofire

class Client {
    static func register(with content: Registration, andURL url: String, completion: @escaping (Result<Response, AFError>) -> Void) {
        AF.request(url,
                   method: .post,
                   parameters: content).responseDecodable { (response: DataResponse<Response, AFError>) in
            debugPrint(response)
            completion(response.result)
        }
    }
    
    static func login(with content: Login, andURL url: String, completion: @escaping (Result<Token, AFError>) -> Void) {
        AF.request(url,
                   method: .post,
                   parameters: content).responseDecodable { (response: DataResponse<Token, AFError>) in
            debugPrint(response)
            completion(response.result)   
        }
    }
    
    static func me(with token: String, andURL url: String, completion: @escaping (Result<Response, AFError>) -> Void) {
        AF.request(url,
                   method: .get,
                   parameters: token).responseDecodable { (response: DataResponse<Response, AFError>) in
            
            
        }
    }
}
