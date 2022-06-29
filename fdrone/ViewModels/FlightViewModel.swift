//
//  FlightViewModel.swift
//  fdrone
//
//  Created by Sean Hong on 2022/06/22.
//

import Foundation
import Alamofire

class FlightViewModel: ObservableObject {
    @Published var token: String = ""
    @Published var isRegistered: Bool = false
    @Published var flightID: String = ""
    @Published var path: [Coordinates] = []
    @Published var flightContent: FlightRequest = FlightRequest(flight_path: [])
    
    func registerFlightPath() {
        let url = Request.ProductionServer.baseAWSURL.appending(Request.FlightBody.flightPath.appending(flightID).appending("/"))
        let header: HTTPHeaders = [
            "Authorization": "Token \(self.token)",
        ]
        flightContent.flight_path = self.path
        Client.registerFlightPath(with: self.flightContent, andURL: url, andHeader: header) { result in
            switch result {
            case .success(let content):
                self.isRegistered = true
                print(content)
            case .failure(let error):
                debugPrint(error.localizedDescription)
            }
        }
    }
    
    func requestFlightPath() {
        let url = Request.ProductionServer.baseAWSURL.appending(Request.FlightBody.flightPath)
        let header: HTTPHeaders = [
            "Authorization": "Token \(self.token)",
        ]
        
        Client.requestFlightPath(with: header, andURL: url) { result in
            switch result {
            case .success(let content):
                if content.results.isEmpty {
                    self.isRegistered = false
                } else {
                    self.isRegistered = true
                    self.path = content.results.first!.flight_path
                }
                
            case .failure(let error):
                debugPrint(error.localizedDescription)
            }
        }
    }
    
    func startFlight() {
        let url = Request.ProductionServer.droneURL.appending(Request.StartBody.startPath)
        
        Client.startFlight(with: "", andURL: url) { result in
            switch result {
            case .success(let isSuccessful):
                print(isSuccessful)
            case .failure(let error):
                debugPrint(error.localizedDescription)
            }
        }
    }
}
