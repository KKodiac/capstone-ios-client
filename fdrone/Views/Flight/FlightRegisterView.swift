//
//  FlightRegisterView.swift
//  fdrone
//
//  Created by Sean Hong on 2022/06/16.
//

import SwiftUI

struct FlightRegisterView: View {
    @Environment(\.dismiss) private var dismiss
    @ObservedObject var droneObject: DroneViewModel
    @ObservedObject private var mapViewModel = Coordinator()
    @ObservedObject private var flightObject = FlightViewModel()
    @State private var isSetToFly = false
    var body: some View {
        NavigationView {
            ZStack(alignment: .bottom) {
                MapView(coordinator: mapViewModel, paths: flightObject.path)
                .edgesIgnoringSafeArea(.all)
            HStack {
                Button("뒤로가기") {
                    mapViewModel.markers = []
                    dismiss()
                }
                .font(.headline)
                .frame(width: 120, height: 60)
                .foregroundColor(.black)
                .background(RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 3).foregroundColor(Color.blue).background(.white))
                .cornerRadius(10.0)
                NavigationLink(destination: LiveFlightView(), isActive: $isSetToFly) { EmptyView() }
                Button("경로 등록하기") {
                    if droneObject.isRegistered {
                        flightObject.token = droneObject.token
                        flightObject.flightID = droneObject.drone.flight
                        flightObject.path = mapViewModel.coordinates
                        print(flightObject.path)
                        flightObject.registerFlightPath()
                        self.isSetToFly = true
                        flightObject.startFlight()
                    }
                }
                .font(.headline)
                .frame(width: 120, height: 60)
                .foregroundColor(.white)
                .background(.blue)
                .cornerRadius(10.0)
            }
            
        }
        .navigationTitle("")
        .navigationBarHidden(true)
        }
        .navigationBarBackButtonHidden(true)
        .onAppear {
            if droneObject.isRegistered {
                flightObject.token = droneObject.token
                flightObject.requestFlightPath()
            }
        }
    }
}
