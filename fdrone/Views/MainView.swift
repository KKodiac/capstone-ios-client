//
//  MainView.swift
//  fdrone
//
//  Created by Sean Hong on 2022/06/12.
//

import SwiftUI
import LottieUI

struct MainView: View {
    @ObservedObject var credentialObject: CredentialObject
    @State private var showWebView = false
    let map = LUStateData(type: .filepath("/Users/seanhong/Developer/CapstoneDesign/fdrone/fdrone/Animations/map.json"), loopMode: .loop)
    let drone = LUStateData(type: .filepath("/Users/seanhong/Developer/CapstoneDesign/fdrone/fdrone/Animations/drone.json"), loopMode: .loop)
    let ok = LUStateData(type: .filepath("/Users/seanhong/Developer/CapstoneDesign/fdrone/fdrone/Animations/okey.json"), loopMode: .loop)
    let fire = LUStateData(type: .filepath("/Users/seanhong/Developer/CapstoneDesign/fdrone/fdrone/Animations/fire-alt.json"), loopMode: .loop)

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
                                Text("미등록")
                                    .fontWeight(.medium)
                            }
                            Spacer()
                            Divider()
                            Spacer()
                            // MARK: 드론 배포 사이트 명
                            HStack {
                                Text("미등록")
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
                    NavigationLink(destination: DroneRegisterView()) {
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
                    NavigationLink(destination: FlightRegisterView()){
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
                    WebView(url: URL(string: "http://localhost:8001")!)
                }
            }
            .edgesIgnoringSafeArea(.top)
        }
        .padding()
        .navigationBarBackButtonHidden(true)
        .navigationTitle("")
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Text("어서오세요")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.blue)
                    .padding(.top, 20)
            }
        }
        .onAppear {
            credentialObject.requestMe()
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        let credentials = CredentialObject()
        MainView(credentialObject: credentials)
    }
}
