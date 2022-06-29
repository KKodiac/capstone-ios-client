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

struct DroneRequest: Encodable {
    let drone_alias: String
    let surveilance_area: String
}

struct FlightRequest: Encodable {
    var flight_path: [Coordinates]
}

struct Response: Decodable {
    let email: String
    let username: String
    let id: String
}

struct Token: Decodable {
    let auth_token: String
}

struct DroneBody: Decodable {
    let surveilance_area: String?
    let drone_alias: String?
    let is_active: Bool
    let admin: String
    let flight: String
    let id: String
}

struct DroneResponse: Decodable {
    let count: Int
    let next: String?
    let previous: String?
    let results: [DroneBody]
}

struct FlightPathBody: Decodable {
    let id: String
    let flight_path: [Coordinates]
    let admin: String
}

struct Coordinates: Decodable, Encodable {
    let lat: Double
    let lng: Double
}

struct FlightPathResponse: Decodable {
    let count: Int
    let next: String?
    let previous: String?
    let results: [FlightPathBody]
}

struct Request {
    struct ProductionServer {
//        static let baseAWSURL = "http://localhost:8000"
        static let baseAWSURL = "http://ec2-13-125-138-109.ap-northeast-2.compute.amazonaws.com:8000"
        static let droneURL = "https://f4b8-118-222-85-227.jp.ngrok.io/drone/detect"
    }
    
    struct RegisterBody {
        static let registrationPath = "/auth/users/"
        static let retrieveTokenPath = "/auth/token/login/"
    }
    
    struct MeBody {
        static let mePath = "/auth/users/me/"
    }
    
    struct DroneBody {
        static let dronePath = "/api/v1/drones/"
    }
    
    struct FlightBody {
        static let flightPath = "/api/v1/flights/"
    }
    
    struct LiveBody {
        static let livePath = "/drone/detect"
    }
    struct StartBody {
        static let startPath = "/drone/detect"
    }
}
