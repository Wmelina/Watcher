//
//  NewEventViewModel.swift
//  Watcher
//
//  Created by Alexandr Kurdyukov on 18/05/2019.
//  Copyright © 2019 Alexandr Kurdyukov. All rights reserved.
//

import Foundation
import Firebase
import FirebaseDatabase
import CodableFirebase

class NewEventViewModel {
    
    func postToDB(event: MEvent) {
        let firEvent = try! FirebaseEncoder().encode(event)
        Database.database().reference().child("places").childByAutoId().setValue(firEvent)
    }
    
    func castToMEvent(title: String, description: String, latitude: String, longitude: String, type: Int) -> MEvent {
        return MEvent(title: title, description: description, latitude: latitude, longitude: longitude, type: type)
    }
}
