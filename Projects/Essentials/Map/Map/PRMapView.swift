//
//  PRMapView.swift
//  Map
//
//  Created by Prashanna Raghavan on 8/16/17.
//  Copyright © 2017 ASU. All rights reserved.
//

import UIKit
import MapKit

class PRMapView: MKMapView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

    let regionRadius:CLLocationDistance = 1000
    
    func centerMap(location: CLLocation) -> Void {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate, regionRadius*2, regionRadius*2)
        self.setRegion(coordinateRegion, animated: true)
    }
}
