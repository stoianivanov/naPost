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
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let levelView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var mapKit: MKMapView = {
        let map = MKMapView()
        map.translatesAutoresizingMaskIntoConstraints = false
        map.delegate = self
        return map
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        
        self.view.addSubview(descriptionLabel)
        self.view.addSubview(levelView)
        self.view.addSubview(mapKit)
        
        self.view.addConstraintsWithFormat("H:|-8-[v0]-8-|", views: descriptionLabel)
        self.view.addConstraintsWithFormat("H:|-8-[v0(10)]|", views: levelView)
        self.view.addConstraintsWithFormat("H:|-8-[v0]-8-|", views: mapKit)
        self.view.addConstraintsWithFormat("V:|-72-[v0]-8-[v1(10)]-8-[v2]-8-|", views: descriptionLabel, levelView, mapKit)
        
        fetchDisaster()
    }
    
    func fetchDisaster(){
        if currentDisaster != nil {
            self.title = currentDisaster?.getTitleForType()
            let clLocation = CLLocationCoordinate2D(latitude: 46.7667, longitude: 23.58)
            print(currentDisaster?.location)
            
            descriptionLabel.text = currentDisaster?.descriptionText
            levelView.backgroundColor = currentDisaster?.getLevelColor()
            centerMapOnLocation(location: clLocation)
        }
    }
    
    func centerMapOnLocation(location: CLLocationCoordinate2D) {
        let region = MKCoordinateRegionMakeWithDistance(
            location, regionRadius * 2.0, regionRadius * 2.0)
        mapKit.setRegion(region, animated: true)
    }
    
    func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
        let clLocation = CLLocationCoordinate2D(latitude: (currentDisaster?.location?.0)!, longitude: (currentDisaster?.location?.1)!)
        let region = MKCoordinateRegionMakeWithDistance(
            clLocation, 0.05, 0.05)
        
        mapKit.setRegion(region, animated: true)
    }
}
