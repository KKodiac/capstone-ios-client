//
//  DroneRegisterView.swift
//  fdrone
//
//  Created by Sean Hong on 2022/06/16.
//

import SwiftUI

struct DroneRegisterView: View {
    @ObservedObject var droneViewModel: DroneViewModel
    @Binding var token: String
    @Environment(\.dismiss) private var dismiss
    var body: some View {
        GeometryReader { geometry in
            VStack {
                VStack {
                    TextField("드론 애칭을 적어주세요", text: $droneViewModel.droneName)
                        .background(.white)
                        .textFieldStyle(DroneTextFieldStyle())
                        .textInputAutocapitalization(.never)
                    TextField("감시 위치를 적어주세요", text: $droneViewModel.surveillanceArea)
                        .background(.white)
                        .textFieldStyle(DroneTextFieldStyle())
                        .textInputAutocapitalization(.never)
                }
                .navigationTitle("")
            }
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("뒤로가기") {
                        dismiss()
                    }
                }

                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(destination: FlightRegisterView(droneObject: droneViewModel), isActive: $droneViewModel.isRegistered) { Text("비행경로 등록하기")
                            .onTapGesture {
                                droneViewModel.requestDroneRegistration()
                        }
                    }
                }
            }
            .onAppear {
                droneViewModel.token = token
                print(droneViewModel.token)
            }
        }
        
    }
}
