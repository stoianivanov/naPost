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
    
    let disasterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let typeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
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
        view.layer.cornerRadius = 12.5
        view.layer.masksToBounds = true
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
        self.navBar.titleLabel.text = "Details"
        self.view.addSubview(disasterImageView)
        self.view.addSubview(typeLabel)
        self.view.addSubview(descriptionLabel)
        self.view.addSubview(levelView)
        self.view.addSubview(mapKit)
        
        self.view.addConstraintsWithFormat("H:|-8-[v0(50)]-8-[v1]-8-|", views: disasterImageView, typeLabel)
        self.view.addConstraintsWithFormat("H:|-8-[v0]-8-|", views: descriptionLabel)


        self.view.addConstraintsWithFormat("H:|-8-[v0]-8-|", views: mapKit)

        self.view.addConstraintsWithFormat("V:|-72-[v0(50)]-[v1]-8-[v2]-8-|", views: disasterImageView, descriptionLabel, mapKit)
        self.view.addConstraint(NSLayoutConstraint(item: typeLabel, attribute: .centerY, relatedBy: .equal, toItem: disasterImageView, attribute: .centerY, multiplier: 1, constant: 0))
        self.view.addConstraint(NSLayoutConstraint(item: levelView, attribute: .centerY, relatedBy: .equal, toItem: disasterImageView, attribute: .centerY, multiplier: 1, constant: 0))
        self.view.addConstraint(NSLayoutConstraint(item: levelView, attribute: .trailing, relatedBy: .equal, toItem: self.view, attribute: .trailing, multiplier: 1, constant: -8))
        levelView.heightAnchor.constraint(equalToConstant: 25).isActive = true
        levelView.widthAnchor.constraint(equalToConstant: 25).isActive = true
        
        fetchDisaster()
    }
    
    func fetchDisaster(){
        if currentDisaster != nil {
            self.title = "Details"
            self.title = currentDisaster?.getTitleForType()
            let clLocation = CLLocationCoordinate2D(latitude: (currentDisaster?.location?.0)!, longitude: (currentDisaster?.location?.1)!)
            print(currentDisaster?.location)
            
            let image = UIImage(named: imageName()!)
            disasterImageView.image = image
            typeLabel.text = currentDisaster?.getTitleForType()
            
            descriptionLabel.text = currentDisaster?.descriptionText
            levelView.backgroundColor = currentDisaster?.getLevelColor()
            centerMapOnLocation(location: clLocation)
        }
    }
    
    func centerMapOnLocation(location: CLLocationCoordinate2D) {
        let region = MKCoordinateRegionMakeWithDistance(location, 2000, 2000)
        mapKit.setRegion(region, animated: true)
    }
    
    func imageName() -> String? {
        guard
            let validDisaster = currentDisaster?.disasterType
            else{
                return nil
        }
        switch validDisaster {
        case .flood:
            return "Flood"
        case .fire:
            return "Fire"
        case .attack:
            return "Attack"
        case .gasLeak:
            return "GasLeak"
        case .earthquake:
            return "Earthquake"
        case .landslide:
            return "Landslide"
        case .hail:
            return "Hail"
        case .chemicalRisk:
            return "ChemicalRisk"
        case .radiationRisk:
            return "Radiationrisk"
        }
    }
    
}
