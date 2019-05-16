//
//  MapViewController.swift
//  Watcher
//
//  Created by Alexandr Kurdyukov on 14/05/2019.
//  Copyright © 2019 Alexandr Kurdyukov. All rights reserved.
//

import UIKit
import GoogleMaps

class MapViewController: UIViewController {
    
    let mView = MapView()
    private let locationManager = CLLocationManager()

    override func loadView() {
        super.loadView()
        self.view = mView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()

    }
}

extension MapViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        guard status == .authorizedWhenInUse else {
            return
        }
        locationManager.startUpdatingLocation()
        mView.map.isMyLocationEnabled = true
        mView.map.settings.myLocationButton = true
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.first else {
            return
        }
        
        mView.map.camera = GMSCameraPosition(target: location.coordinate, zoom: 15, bearing: 0, viewingAngle: 0)
        locationManager.stopUpdatingLocation()
    }
}
