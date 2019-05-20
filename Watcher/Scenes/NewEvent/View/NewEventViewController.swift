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
    private let viewModel = NewEventViewModel()
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
        if nView.title.text?.count ?? 0 > 0 && nView.desc.text?.count ?? 0 > 0 {
        viewModel.postToDB(event: viewModel.castToMEvent(title: nView.title.text!, description: nView.desc.text!, latitude: "\(coord.latitude)", longitude: "\(coord.longitude)", type: nView.type.selectedSegmentIndex))
            
            let alert = UIAlertController(title: "Успех", message: "Место успешно добавлено", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Хорошо", style: .default, handler: .none))
            self.present(alert, animated: true)
            
            nView.desc.text = ""
            nView.title.text = ""
            
        } else {
            let alert = UIAlertController(title: "Ошибка", message: "Заполните обязательные поля", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Хорошо", style: .default, handler: .none))
            self.present(alert, animated: true)
        }
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

extension NewEventViewController: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if range.location == 0 && string.contains(" ") {
            return false
        }
        
        return true
    }
    
}
