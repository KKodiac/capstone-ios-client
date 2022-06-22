//
//  MapViewModel.swift
//  fdrone
//
//  Created by Sean Hong on 2022/06/22.
//

import Foundation
import NMapsMap
import CoreLocation

class Coordinator: NSObject, NMFMapViewCameraDelegate, NMFMapViewTouchDelegate, CLLocationManagerDelegate, ObservableObject {
    var coord: (Double, Double)
    @Published var authorizationStatus: CLAuthorizationStatus
    @Published var lastLocation: CLLocation?
    private let locationManager = CLLocationManager()
    @Published var markers: [NMFMarker] = []
    @Published var coordinates: [Coordinates] = []
    
    override init() {
        self.coord = (37.34164, 126.73229)
        authorizationStatus = locationManager.authorizationStatus
        super.init()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
    }
    
    func requestPermission() {
        locationManager.requestWhenInUseAuthorization()
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        authorizationStatus = manager.authorizationStatus
    }
    
    func requestLocation() {
        locationManager.requestLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        lastLocation = locations.last
    }
    
    
    func mapView(_ mapView: NMFMapView, didTapMap latlng: NMGLatLng, point: CGPoint) {
        let marker = NMFMarker()
        marker.position = NMGLatLng(lat: latlng.lat, lng: latlng.lng)
        marker.mapView = mapView
        markers.append(marker)
        coordinates.append(Coordinates(lat: latlng.lat, lng: latlng.lng))
    }
}
