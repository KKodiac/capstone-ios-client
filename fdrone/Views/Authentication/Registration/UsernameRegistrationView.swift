//
//  UsernameRegistrationView.swift
//  fdrone
//
//  Created by Sean Hong on 2022/06/12.
//

import SwiftUI

struct UsernameRegistrationView: View {
    @ObservedObject var registrationObject: CredentialObject

    var body: some View {
        GeometryReader { geometry in
            VStack {
                TextField("아이디", text: $registrationObject.username)
                    .background(.white)
                    .textFieldStyle(MyTextFieldStyle())
                    .textInputAutocapitalization(.never)
                Spacer(minLength: geometry.size.height * 0.3)
                VStack(alignment: .center) {
                    NavigationLink(destination: PasswordRegistrationView(credentialObject: registrationObject)) {
                        Button("아이디 입력") { }
                        .font(.headline)
                        .frame(width: geometry.size.width, height: 60)
                        .foregroundColor(.white)
                        .background(.blue)
                        .cornerRadius(10.0)
                        .disabled(true)
                    }
                    .isDetailLink(false)
                    .navigationBarBackButtonHidden(true)
                }
                Spacer()
            }
        }
        .padding([.bottom, .trailing, .leading], 28)
    }
}
