//
//  MapViewModel.swift
//  Watcher
//
//  Created by Alexandr Kurdyukov on 18/05/2019.
//  Copyright © 2019 Alexandr Kurdyukov. All rights reserved.
//

import Foundation
import FirebaseDatabase
import CodableFirebase
import GoogleMaps

class MapViewModel {
    var ref: DatabaseReference!
    var events: [MEvent]!
    
    init(map: GMSMapView) {
        ref = Database.database().reference()
        events = []
        getEventsAndShowOnMap(map: map)
    }
    
    func getEventsAndShowOnMap(map: GMSMapView) {
        ref.child("places").observe(.childAdded) { (data) in
            guard let value = data.value else { return }
            do {
                let model = try FirebaseDecoder().decode(MEvent.self, from: value)
                self.addMarkerOnMap(event: model, map: map)
                self.events.append(model)
                print(model)
            } catch let error {
                print(error)
            }
        }
    }
    
    func addMarkerOnMap(event: MEvent, map: GMSMapView) {
        let latitude = Double(event.latitude)
        let longitude = Double(event.longitude)
        let position = CLLocationCoordinate2D(latitude: latitude!, longitude: longitude!)
        let marker = GMSMarker(position: position)
        marker.title = event.title
        marker.appearAnimation = .pop
        if event.type == 0 {
            marker.icon = GMSMarker.markerImage(with: .blue)
        } else if event.type == 1 {
            marker.icon = GMSMarker.markerImage(with: .red)
        } else {
            marker.icon = GMSMarker.markerImage(with: .green)
        }
        marker.snippet = event.description
        marker.map = map
    }
}
