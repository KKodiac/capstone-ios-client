//
//  LoginView.swift
//  fdrone
//
//  Created by Sean Hong on 2022/06/12.
//

import SwiftUI

struct LoginView: View {
    @State private var username = ""
    @State private var password = ""
    var body: some View {
        NavigationView {
            VStack {
                VStack(alignment: .leading) {
                    Image("login")
                        .resizable(resizingMode: .stretch)
                        .aspectRatio(contentMode: .fit)
                    Text("Login")
                        .font(.title)
                        .fontWeight(.bold)
                        .padding()
                    TextField("아이디", text: $username)
                        .padding([.trailing,.leading])
                        .textFieldStyle(.roundedBorder)
                    SecureField("비밀번호", text: $password)
                        .padding([.trailing,.leading])
                        .textFieldStyle(.roundedBorder)
                    GeometryReader { geometry in
                        VStack {
                            NavigationLink(destination: MainView()) {
                                Button("로그인") {}
                                .font(.headline)
                                .frame(width: geometry.size.width, height: geometry.size.height * 0.25)
                                .foregroundColor(.white)
                                .background(.blue)
                                .cornerRadius(10.0)
                                .disabled(true)
                            }
                            
                            NavigationLink(destination: SignUpView()) {
                                Button("회원가입") {}
                                    .font(.subheadline)
                                    .frame(width: geometry.size.width, height: geometry.size.height * 0.25)
                                    .foregroundColor(.black)
                                    .background(RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 3).foregroundColor(Color.blue))
                                    .cornerRadius(10.0)
                                    .disabled(true)
                            }
                        }
                    }
                    .padding([.top, .leading, .trailing], 18.0)
                }
                .padding(.all)
                
            }
            .navigationBarTitle("", displayMode: .inline)
            .navigationBarHidden(true)
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
