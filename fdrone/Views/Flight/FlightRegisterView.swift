//
//  FlightRegisterView.swift
//  fdrone
//
//  Created by Sean Hong on 2022/06/16.
//

import SwiftUI

struct FlightRegisterView: View {
    var body: some View {
        MapObject()
            .edgesIgnoringSafeArea(.vertical)
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
    }
}

struct FlightRegisterView_Previews: PreviewProvider {
    static var previews: some View {
        FlightRegisterView()
    }
}
