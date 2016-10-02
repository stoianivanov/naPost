//
//  ReportVC.swift
//  OnPost
//
//  Created by Emil Iliev on 10/1/16.
//  Copyright © 2016 Marina Georgieva. All rights reserved.
//

import UIKit
import MapKit


class ReportVC: CustomVC, UIPickerViewDelegate, UIPickerViewDataSource, CLLocationManagerDelegate{

    var disasterComplex  = [["Flood", "Fire", "Attack", "Gas leak", "EarthQuake", "Landslide", "Hail", "Chemical risk", "Radiation risk"], ["Green", "Yellow", "Orange", "Red"]]
    
    lazy var eventPicker: UIPickerView = {
        let picker = UIPickerView()
        picker.translatesAutoresizingMaskIntoConstraints = false
        picker.delegate = self
        picker.dataSource = self
        return picker
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Roboto", size: 14)
        label.textAlignment = .left
        label.text = "Description:"
        return label
    }()
    
    let descriptionField: UITextView = {
        let descr = UITextView()
        descr.translatesAutoresizingMaskIntoConstraints = false
        descr.layer.borderWidth = 1
        descr.layer.borderColor = UIColor(r: 51, g: 51, b: 51, alpha: 1).cgColor
        descr.layer.cornerRadius = 4
        descr.layer.masksToBounds = true
        return descr
    }()
    
    let mapKit: MKMapView = {
        let map = MKMapView()
        map.translatesAutoresizingMaskIntoConstraints = false
        map.layer.borderWidth = 1
        map.layer.borderColor = UIColor(r: 51, g: 51, b: 51, alpha: 1).cgColor
        map.layer.cornerRadius = 4
        map.layer.masksToBounds = true
        return map
    }()
    
     var locationManager: CLLocationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(r: 239, g: 239, b: 239, alpha: 1)
        
        let reportTitle = String(format: "%C", 0xf067)
        navBar.reportButton.setTitle(reportTitle, for: .normal)
        
        self.view.addSubview(eventPicker)
        self.view.addConstraintsWithFormat("H:|-8-[v0]-8-|", views: eventPicker)

        eventPicker.heightAnchor.constraint(equalToConstant: 100).isActive = true
        self.view.addSubview(descriptionLabel)
        self.view.addConstraintsWithFormat("H:|-8-[v0]-8-|", views: descriptionLabel)
        
        self.view.addSubview(descriptionField)
        self.view.addConstraintsWithFormat("H:|-8-[v0]-8-|", views: descriptionField)
        
        self.view.addSubview(mapKit)
        self.view.addConstraintsWithFormat("H:|-8-[v0]-8-|", views: mapKit)
        
        self.view.addConstraintsWithFormat("V:|-72-[v0]-8-[v1]-8-[v2(150)]-8-[v3]|", views: eventPicker, descriptionLabel, descriptionField, mapKit)
        
        mapKit.showsUserLocation = true

        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.startUpdatingLocation()
        self.mapKit.showsUserLocation = true
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation])
    {
        
        let location = locations.last
        let center = CLLocationCoordinate2D(latitude: location!.coordinate.latitude, longitude: location!.coordinate.longitude)
        let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
        self.mapKit.setRegion(region, animated: true)
        self.locationManager.stopUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error)
    {
        print("Errors: " + error.localizedDescription)
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return disasterComplex.count
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return disasterComplex[component].count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return disasterComplex[component][row]
    }
    
    override func reportAction() {
        print("asd")
    }
    
}
