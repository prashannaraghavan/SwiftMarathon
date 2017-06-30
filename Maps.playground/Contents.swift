//: Playground - noun: a place where people can play

import UIKit
import PlaygroundSupport
import MapKit

// set the zoom
let delta = 1.75

// set the size of the map
let frame = CGRect( x:0, y:0, width:200, height:200 )
let rview = UIView( frame:frame )
let lframe = CGRect( x:0, y:0, width:100, height:30 )
let rlabel = UILabel( frame:lframe )
rlabel.text = "Sample"
rview.addSubview(rlabel)

/*
let mapView = MKMapView( frame: frame )

// create and populate a coordinate region struct
var region = MKCoordinateRegion()
region.center.latitude = 32.0
region.center.longitude = -102.0

// span defines the zoom
region.span.latitudeDelta = delta
region.span.longitudeDelta = delta

// inform the mapView of these edits
mapView.setRegion( region, animated: true )

// view the map in the timeline!
PlaygroundPage.current.liveView = mapView
 */

PlaygroundPage.current.liveView = rview