//
//  DetailDisasterViewController.swift
//  OnPost
//
//  Created by Emil Iliev on 10/1/16.
//  Copyright © 2016 Marina Georgieva. All rights reserved.
//

import UIKit
import MapKit

class DetailDisasterViewController: CustomVC, MKMapViewDelegate{

    var currentDisaster: Disaster? = nil
    let regionRadius: CLLocationDistance = 1000
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
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

//        self.view.addConstraint(NSLayoutConstraint(item: mapKit, attribute: .top, relatedBy: .equal, toItem: navBar, attribute: .bottom, multiplier: 1, constant: 0))
//        self.view.addConstraint(NSLayoutConstraint(item: mapKit, attribute: .bottom, relatedBy: .equal, toItem: self.view, attribute: .bottom, multiplier: 1, constant: 8))
        fetchDisaster()
    }
    
    func fetchDisaster(){
        if currentDisaster != nil {
            self.title = currentDisaster?.getTitleForType()
            let clLocation = CLLocationCoordinate2D(latitude: (currentDisaster?.location?.0)!, longitude: (currentDisaster?.location?.1)!)
            print(currentDisaster?.location)
            
            descriptionLabel.text = currentDisaster?.descriptionText
            levelView.backgroundColor = currentDisaster?.getLevelColor()
            centerMapOnLocation(location: clLocation)
        }
    }
    
    func centerMapOnLocation(location: CLLocationCoordinate2D) {
        let region = MKCoordinateRegionMakeWithDistance(location, 2000, 2000)
        mapKit.setRegion(region, animated: true)
        let clLocation = CLLocationCoordinate2D(latitude: (currentDisaster?.location?.0)!, longitude: (currentDisaster?.location?.1)!)
        let objectAnnotation = MKPointAnnotation()
        objectAnnotation.coordinate = clLocation
        objectAnnotation.title = currentDisaster?.getTitleForType()
        mapKit.addAnnotation(objectAnnotation)
    }
}
