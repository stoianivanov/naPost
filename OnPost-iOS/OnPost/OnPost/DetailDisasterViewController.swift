//
//  DetailDisasterViewController.swift
//  OnPost
//
//  Created by Emil Iliev on 10/1/16.
//  Copyright © 2016 Marina Georgieva. All rights reserved.
//

import UIKit
import MapKit

class DetailDisasterViewController: UIViewController, MKMapViewDelegate{

    var currentDisaster: Disaster? = nil
    let regionRadius: CLLocationDistance = 1000
    lazy var mapKit: MKMapView = {
        let map = MKMapView()
        map.translatesAutoresizingMaskIntoConstraints = false
        map.delegate = self
        return map
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
    
        self.view.addSubview(mapKit)
        self.view.addConstraintsWithFormat("H:|-8-[v0]-8-|", views: mapKit)
        self.view.addConstraintsWithFormat("V:|[v0]-8-|", views: mapKit)
        
        fetchDisaster()
    }
    
    func fetchDisaster(){
        if currentDisaster != nil {
         self.title = currentDisaster?.getTitleForType()
            let clLocation = CLLocationCoordinate2D(latitude: (currentDisaster?.location.0)!, longitude: (currentDisaster?.location.1)!)
            print(currentDisaster?.location)
            centerMapOnLocation(location: clLocation)
            
        }
    }
    
    func centerMapOnLocation(location: CLLocationCoordinate2D) {
        let region = MKCoordinateRegionMakeWithDistance(
            location, 0.05, 0.05)
        mapKit.setRegion(region, animated: true)
    }
    
    func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
        let clLocation = CLLocationCoordinate2D(latitude: (currentDisaster?.location.0)!, longitude: (currentDisaster?.location.1)!)
        let region = MKCoordinateRegionMakeWithDistance(
            clLocation, 0.05, 0.05)
        
        mapKit.setRegion(region, animated: true)
    }
    
    
    
}
