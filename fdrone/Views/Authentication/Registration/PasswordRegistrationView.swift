//
//  PasswordRegistrationView.swift
//  fdrone
//
//  Created by Sean Hong on 2022/06/12.
//

import SwiftUI

struct PasswordRegistrationView: View {
    @StateObject var credentialObject: CredentialViewModel
    @ObservedObject var droneObject = DroneViewModel()
    @Environment(\.dismiss) var dismiss

    var body: some View {
        GeometryReader { geometry in
            VStack {
                SecureField("비밀번호", text: $credentialObject.password)
                    .background(.white)
                    .textFieldStyle(MyTextFieldStyle())
                    .textInputAutocapitalization(.never)
                Spacer(minLength: geometry.size.height * 0.3)
                VStack(alignment: .center) {
                    NavigationLink(destination: MainView(credentialObject: credentialObject, droneObject: droneObject), isActive: $credentialObject.isLoggedIn) { EmptyView() }
                    Button("회원가입 완료") {
                        credentialObject.requestRegistration()
                        credentialObject.requestLogin()
                        print(credentialObject.isLoggedIn)
                        dismiss()
                    }
                        .font(.headline)
                        .frame(width: geometry.size.width, height: 60)
                        .foregroundColor(.white)
                        .background(.blue)
                        .cornerRadius(10.0)
                        .navigationBarBackButtonHidden(true)
                }
                Spacer()
            }
        }
        .padding([.bottom, .trailing, .leading], 28)
    }
}

