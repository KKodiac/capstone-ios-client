//
//  DroneViewModel.swift
//  fdrone
//
//  Created by Sean Hong on 2022/06/22.
//

import Foundation
import Alamofire

class DroneViewModel: ObservableObject {
    @Published var droneName: String = ""
    @Published var surveillanceArea: String = ""
    @Published var token: String = ""
    @Published var isRegistered: Bool = false
    @Published var drone: DroneBody = DroneBody(surveilance_area: nil, drone_alias: nil, is_active: false, admin: "", flight: "", id: "")
    
    func requestDroneRegistration() {
        let content = DroneRequest(drone_alias: droneName, surveilance_area: surveillanceArea)
        let url = Request.ProductionServer.baseURL.appending(Request.DroneBody.dronePath)
        let header: HTTPHeaders = [
            "Authorization": "Token \(self.token)",
        ]
        Client.registerDrone(with: content, andURL: url, andHeader: header) { result in
            switch result {
            case .success(let content):
                print(content)
                self.isRegistered = true
            case .failure(let error):
                debugPrint(error.localizedDescription)
            }
        }
    }
    
    func requestDrone() {
        let header: HTTPHeaders = [
            "Authorization": "Token \(self.token)",
        ]
        let url = Request.ProductionServer.baseURL.appending(Request.DroneBody.dronePath)

        Client.requestDrone(with: header, andURL: url) { result in
            switch result {
            case .success(let content):
                if content.results.isEmpty {
                    self.isRegistered = false
                } else {
                    self.isRegistered = true
                    self.drone = content.results.first!
                }
            case .failure(let error):
                debugPrint(error.localizedDescription)
            }
        }
    }
}
