//
//  NewEventViewController.swift
//  Watcher
//
//  Created by Alexandr Kurdyukov on 14/05/2019.
//  Copyright © 2019 Alexandr Kurdyukov. All rights reserved.
//

import UIKit
import GoogleMaps

class NewEventViewController: UIViewController {

    private let locationManager = CLLocationManager()
    
    var coord = CLLocationCoordinate2D()
    var nView: NewEventView!

    override func viewDidLoad() {
        super.viewDidLoad()
        nView = NewEventView()
        view = nView
        
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        nView.button.addTarget(self, action: #selector(tappedButton), for: .touchUpInside)
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
        }
    }
    
    @objc func tappedButton() {
        print("zdarova")
        print(coord.latitude)
    }
}

extension NewEventViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        guard status == .authorizedWhenInUse else {
            return
        }
        locationManager.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        coord = manager.location!.coordinate
    }
}
