//
//  MapView.swift
//  Watcher
//
//  Created by Alexandr Kurdyukov on 14/05/2019.
//  Copyright © 2019 Alexandr Kurdyukov. All rights reserved.
//

import UIKit
import GoogleMaps
import SnapKit

class MapView: UIView {

    var map: GMSMapView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        GMSServices.provideAPIKey("AIzaSyCNe3hj81R9vsuH7PW7H79tF52mdoe8KFA")

        map = GMSMapView()
        addSubview(map!)
        map!.snp.makeConstraints { (make) in
            make.edges.equalTo(0)
        }
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
