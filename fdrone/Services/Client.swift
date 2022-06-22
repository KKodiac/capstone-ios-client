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
            debugPrint(response)
            completion(response.result)
        }
    }
    
    static func registerDrone(with content: DroneRequest, andURL url: String, andHeader header: HTTPHeaders, completion: @escaping (Result<DroneResponse, AFError>) -> Void) {
        AF.request(url,
                   method: .post,
                   parameters: content,
                   headers: header).responseDecodable { (response: DataResponse<DroneResponse, AFError>) in
            debugPrint(response)
            completion(response.result)
        }
    }
    
    static func requestDrone(with header: HTTPHeaders, andURL url: String, completion: @escaping  (Result<DroneResponse, AFError>) -> Void){
        AF.request(url,
                   method: .get,
                   headers: header
        ).responseDecodable { (response: DataResponse<DroneResponse, AFError>) in
            debugPrint(response)
            completion(response.result)
        }
    }
    
    static func registerFlightPath(with content: FlightRequest, andURL url: String, andHeader header: HTTPHeaders, completion: @escaping (Result<FlightPathBody, AFError>) -> Void) {
        AF.request(url,
                   method: .put,
                   parameters: content,
                   encoder: JSONParameterEncoder.default,
                   headers: header).responseDecodable { (response: DataResponse<FlightPathBody, AFError>) in
            debugPrint(response)
            completion(response.result)
        }
    }
    
    static func requestFlightPath(with header: HTTPHeaders, andURL url: String, completion: @escaping  (Result<FlightPathResponse, AFError>) -> Void){
        AF.request(url,
                   method: .get,
                   headers: header
        ).responseDecodable { (response: DataResponse<FlightPathResponse, AFError>) in
            debugPrint(response)
            completion(response.result)
        }
    }
    
    static func startFlight(with content: String, andURL url: String, completion: @escaping  (Result<String, AFError>) -> Void) {
        AF.request(url,
                   method: .get
        ).responseDecodable { (response: DataResponse<String, AFError>) in
            debugPrint(response)
            completion(response.result)
        }
    }
}
