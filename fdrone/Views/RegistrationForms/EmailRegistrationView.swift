//
//  EmailRegistrationView.swift
//  fdrone
//
//  Created by Sean Hong on 2022/06/12.
//

import SwiftUI

struct EmailRegistrationView: View {
    @ObservedObject var registrationObject: CredentialObject


    var body: some View {
        GeometryReader { geometry in
            VStack {
                TextField("이메일", text: $registrationObject.email)
                    .background(.white)
                    .textFieldStyle(MyTextFieldStyle())
                    .textInputAutocapitalization(.never)
                Spacer(minLength: geometry.size.height * 0.3)
                VStack(alignment: .center) {
                    NavigationLink(destination: UsernameRegistrationView(registrationObject: registrationObject)) {
                        Button("이메일 입력") { }
                        .font(.headline)
                        .frame(width: geometry.size.width, height: geometry.size.height * 0.25)
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

