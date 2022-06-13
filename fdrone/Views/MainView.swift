//
//  MainView.swift
//  fdrone
//
//  Created by Sean Hong on 2022/06/12.
//

import SwiftUI

struct MainView: View {
    @ObservedObject var credentialObject: CredentialObject
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        let credentials = CredentialObject()
        MainView(credentialObject: credentials)
    }
}
