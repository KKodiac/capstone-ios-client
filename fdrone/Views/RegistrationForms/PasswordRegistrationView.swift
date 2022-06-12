//
//  PasswordRegistrationView.swift
//  fdrone
//
//  Created by Sean Hong on 2022/06/12.
//

import SwiftUI

struct PasswordRegistrationView: View {
    @StateObject var registrationObject: RegistrationObject
    @Environment(\.dismiss) var dismiss

    var body: some View {
        GeometryReader { geometry in
            VStack {
                SecureField("비밀번호", text: $registrationObject.password)
                    .background(.white)
                    .textFieldStyle(MyTextFieldStyle())
                    .textInputAutocapitalization(.never)
                Spacer(minLength: geometry.size.height * 0.3)
                VStack(alignment: .center) {
                    NavigationLink(destination: MainView(), isActive: $registrationObject.isLoggedIn) { EmptyView() }
                    Button("회원가입 완료") {
                        registrationObject.requestRegistration()
                        print(registrationObject.isLoggedIn)
                        dismiss()
                    }
                        .font(.headline)
                        .frame(width: geometry.size.width, height: geometry.size.height * 0.25)
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

