//
//  MainView.swift
//  fdrone
//
//  Created by Sean Hong on 2022/06/12.
//

import SwiftUI
import LottieUI

struct MainView: View {
    @ObservedObject var credentialObject: CredentialViewModel
    @ObservedObject var droneObject: DroneViewModel
    @State private var showWebView = false
    
    @State var map = LUStateData(type: .name("map"), loopMode: .loop)
    let drone = LUStateData(type: .name("drone"), loopMode: .loop)
    let ok = LUStateData(type: .name("okey"), loopMode: .loop)
    let fire = LUStateData(type: .name("fire-alt"), loopMode: .loop)
    var body: some View {
        NavigationView {
            VStack {
                ZStack(alignment: .leading) {
                    RoundedRectangle(cornerRadius: 15)
                        .foregroundColor(Color.blue)
                    VStack {
                        // MARK: 사용자 계정
                        NavigationLink(destination: UserProfileView()) {
                            HStack {
                                VStack(alignment: .leading) {
                                    HStack {
                                        Text(credentialObject.username)
                                            .fontWeight(.heavy)
                                        Text("님")
                                    }.padding(.bottom, 2)
                                    HStack {
                                        Text("행복한 하루 되세요!")
                                    }
                                }
                                .foregroundColor(.white)
                                .font(.headline)
                                
                                Spacer()
                                Image(systemName: "person.circle.fill")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .foregroundColor(Color.white)
                            }
                        }
                        Divider()
                        HStack {
                            Spacer()
                            // MARK: 책임 드론 명
                            HStack {
                                Text(droneObject.drone.drone_alias ?? "미등록")
                                    .fontWeight(.medium)
                            }
                            Spacer()
                            Divider()
                            Spacer()
                            // MARK: 드론 배포 사이트 명
                            HStack {
                                Text(droneObject.drone.surveilance_area ?? "미등록")
                                    .fontWeight(.medium)
                            }
                            Spacer()
                        }
                        .foregroundColor(.white)
                        .padding(.bottom)
                    }
                    .padding([.top, .leading, .trailing], 30)
                    
                }
                
                ZStack {
                    // MARK: 화재 여부
                    RoundedRectangle(cornerRadius: 15)
                        .foregroundColor(.indigo).brightness(0.1)
                    HStack {
                        VStack {
                            Text("현재는 이상 무!")
                                .font(.title3)
                                .fontWeight(.heavy)
                                .foregroundColor(.white)
                            Text("드론으로 감지된 화재가 없습니다.")
                                .foregroundColor(.white)
                                .padding(.top, 3)
                        }
//                        LottieView(state: ok)
                        LottieView(state: fire)
                    }
                    .padding(30)
                }
                
                HStack {
                    // MARK: 드론 등록
                    NavigationLink(destination: DroneRegisterView(droneViewModel: droneObject, token: $credentialObject.token)) {
                        ZStack {
                            RoundedRectangle(cornerRadius: 15)
                                .foregroundColor(.gray).brightness(0.36)
                            LottieView(state: drone)
                            VStack {
                                Spacer()
                                Text("새로 오셨어요?")
                                    .fontWeight(.regular)
                                    .font(.callout)
                                
                                Text("드론 등록하기")
                                    .fontWeight(.bold)
                                    .font(.headline)
                            }
                            .padding(10)
                        }
                    }
                    .foregroundColor(.black)
                    
                    // MARK: 비행경로 및 비행 시작
                    NavigationLink(destination: FlightRegisterView(droneObject: droneObject)){
                        ZStack {
                            RoundedRectangle(cornerRadius: 15)
                                .foregroundColor(.green)
                            LottieView(state: map)
                            VStack {
                                Spacer()
                                Text("비행경로 입력하고")
                                    .fontWeight(.regular)
                                    .font(.callout)
                                
                                Text("비행 시작하기")
                                    .fontWeight(.bold)
                                    .font(.headline)
                            }
                            .padding(10)
                        }
                    }
                    .foregroundColor(.black)
                }
                
                // MARK: 실시간 웹뷰 영상
                Button {
                    showWebView.toggle()
                } label: {
                    Text("현재 실시간 영상 확인하기")
                }
                .buttonStyle(.borderedProminent)
                .sheet(isPresented: $showWebView) {
                    WebView(url: URL(string: Request.ProductionServer.droneURL)!)
                }
            }
            .edgesIgnoringSafeArea(.top)
            .padding()
            .navigationTitle("어서오세요")
            .navigationBarTitleDisplayMode(.large)
            .onAppear {
                credentialObject.requestMe()
                droneObject.token = credentialObject.token
                droneObject.requestDrone()
            }
        }
        .navigationTitle("")
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        let credentials = CredentialViewModel()
        let drones = DroneViewModel()
        MainView(credentialObject: credentials, droneObject: drones)
    }
}
