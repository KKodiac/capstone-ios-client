//
//  RegistrationModel.swift
//  fdrone
//
//  Created by Sean Hong on 2022/06/13.
//

import Foundation

struct Registration: Encodable {
    let email: String
    let username: String
    let password: String
}

struct Login: Encodable {
    let username: String
    let password: String
}

struct Response: Decodable {
    let email: String
    let username: String
    let id: String
}

struct Token: Decodable {
    let token: String
}

struct Request {
    struct ProductionServer {
        static let baseURL = "http://localhost:8000"
    }
    
    struct RegisterBody {
        static let registrationPath = "/auth/users/"
        static let retrieveTokenPath = "/auth/token/login/"
    }
}
