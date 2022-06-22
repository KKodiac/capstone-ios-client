//
//  SignUpDetailView.swift
//  fdrone
//
//  Created by Sean Hong on 2022/06/12.
//

import Foundation
import SwiftUI

struct SignUpDetailView: View {
    @ObservedObject var registrationObject = CredentialViewModel()
    var body: some View {
        VStack {
            Spacer(minLength: 80)
            NavigationLink(destination: EmailRegistrationView(registrationObject: registrationObject)) {
                VStack {
                    Text("회원가입을 진행합니다")
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundColor(Color.black)
                        .padding(.bottom)
                    Text("여기를 눌러주세요")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundColor(Color.accentColor)
                }
            }
            Spacer(minLength: 160)
        }
    }
}
