//
//  MapObject.swift
//  fdrone
//
//  Created by Sean Hong on 2022/06/17.
//

import Foundation
import SwiftUI
import NMapsMap
import CoreLocation

struct MapView: UIViewRepresentable {
    let coordinator: Coordinator
    var paths: [Coordinates]
    
    func makeCoordinator() -> Coordinator {
        self.coordinator
    }
    
    func makeUIView(context: Context) -> NMFNaverMapView {
        let view = NMFNaverMapView()
        view.showZoomControls = false
        view.mapView.positionMode = .direction
        view.showLocationButton = true
        view.mapView.zoomLevel = 16
        view.mapView.touchDelegate = context.coordinator
        view.mapView.addCameraDelegate(delegate: context.coordinator)
        
        return view
    }
    
    func updateUIView(_ uiView: NMFNaverMapView, context: Context) {
        let coord = NMGLatLng(lat: 37.34164, lng: 126.73229)
        let cameraUpdate = NMFCameraUpdate(scrollTo: coord)
        cameraUpdate.animation = NMFCameraUpdateAnimation.fly
        cameraUpdate.animationDuration = 1
        uiView.mapView.moveCamera(cameraUpdate)
        if !paths.isEmpty {
            for path in paths {
                let marker = NMFMarker(position: NMGLatLng(lat: path.lat, lng: path.lng))
                marker.iconTintColor = .purple
                marker.mapView = uiView.mapView
            }
        }
        
    }
}


