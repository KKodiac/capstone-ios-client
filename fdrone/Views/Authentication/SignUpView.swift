//
//  SignUpView.swift
//  fdrone
//
//  Created by Sean Hong on 2022/06/12.
//

import SwiftUI

struct SignUpView: View {
    var body: some View {
        
        VStack(alignment: .leading) {
            Image("signup")
                .resizable(resizingMode: .stretch)
                .aspectRatio(contentMode: .fit)
            Text("Sign Up")
                .font(.title)
                .fontWeight(.bold)
                .padding([.trailing, .leading], 25)
            NavigationView {
                SignUpDetailView()
                .navigationBarTitle("", displayMode: .inline)
                .navigationBarHidden(true)
            }
        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
