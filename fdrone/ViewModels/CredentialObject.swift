//
//  ViewModel.swift
//  fdrone
//
//  Created by Sean Hong on 2022/06/13.
//

import Foundation
import Alamofire

class CredentialObject: ObservableObject {
    @Published var email: String = ""
    @Published var username: String = ""
    @Published var password: String = ""
    @Published var isLoggedIn: Bool = false
    @Published var token: String = ""
    @Published var userContent: Response?
    
    func requestRegistration() {
        let registration = Registration(email: self.email, username: self.username, password: self.password)
        let url = Request.ProductionServer.baseURL.appending(Request.RegisterBody.registrationPath)
        Client.register(with: registration, andURL: url) { result in
            switch result {
            case .success(let content):
                self.isLoggedIn = true
                print(self.isLoggedIn)
                self.userContent = content
            case .failure(let error):
                debugPrint(error.localizedDescription)
            }
        }
    }
    
    func requestLogin() {
        let login = Login(username: self.username, password: self.password)
        let url = Request.ProductionServer.baseURL.appending(Request.RegisterBody.retrieveTokenPath)
        Client.login(with: login, andURL: url) { result in
            switch result {
            case .success(let content):
                print(content.auth_token)
                self.token = content.auth_token
                self.isLoggedIn = true
            case .failure(let error):
                debugPrint(error.localizedDescription)
            }
        }
    }
    
    func requestMe() {
        let url = Request.ProductionServer.baseURL.appending(Request.MeBody.mePath)
        Client.me(with: self.token, andURL: url) { result in
            switch result {
            case .success(let content):
                self.userContent = content
            case .failure(let error):
                debugPrint(error.localizedDescription)
            }
        }
    }
}
