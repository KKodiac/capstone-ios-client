//
//  LiveFlightView.swift
//  fdrone
//
//  Created by Sean Hong on 2022/06/22.
//

import SwiftUI

struct LiveFlightView: View {
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        VStack {
            Button("홈으로 가기") {
                dismiss()
            }
            WebViewFull(url: URL(string: Request.ProductionServer.droneURL)!)
        }
        .navigationTitle("")
        .navigationBarHidden(true)
    }
}

struct LiveFlightView_Previews: PreviewProvider {
    static var previews: some View {
        LiveFlightView()
    }
}
