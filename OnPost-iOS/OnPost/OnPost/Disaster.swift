//
//  Disaster.swift
//  OnPost
//
//  Created by Emil Iliev on 10/1/16.
//  Copyright © 2016 Marina Georgieva. All rights reserved.
//

import Foundation
import UIKit

enum DisasterType{
    case flood
    case fire
    case gasLeak
    case attack
    case chemicalRisk
    case earthquake
    case hail
    case landslide
    case radiationRisk

}

class Disaster {
    
    var disasterType: DisasterType
    var radius: Int = 1000
    var location: (Double, Double)
    var description: String
    var level: Int
    
    init?(dict: NSDictionary){
        guard
            let disasterDescription = dict["description"] as? String,
            let disLevel = Int((dict["level"] as? String)!),
            let disRadius = Int((dict["radius"] as? String)!),
            let type = Int((dict["type"] as? String)!),
            let disLoc = dict["location"] as? String
        else {
            return nil
        }
        
        description = disasterDescription
        disasterType = .flood
        level = disLevel
        radius = disRadius
        location = (0, 0)
        splitLocation(location: disLoc)
    }
    
    
    func getTitleForType() -> String{
        switch disasterType{
            case .flood:
                return "Flood"
            case .fire:
                return "Fire"
            case .attack:
                return "Attack"
            case .gasLeak:
                return "Gas Leak"
            case .chemicalRisk:
                return "Chemical Risk"
            case .earthquake:
                return "Earthquake"
            case .hail:
                return "Hail"
            case .landslide:
                return "Landslide"
            case .radiationRisk:
                return "Radiation Risk"
        }
    }
    
    func getLevelColor() -> UIColor {
        let colorLevels: [UIColor] = [.red, .orange, .yellow, .green]
        return colorLevels[level]
    }

//    func colorForDisasterType() -> Int{
//        switch disasterType {
//            case .flood:
//                return 0x0000FF
//            case .fire:
//                return 0xFF0000
//            case .attack:
//                return 0xFFFF00
//            case .gasLeak:
//                return 0x008800
//        }
//    }
    
    func descriptionForType() -> String{
        switch disasterType {
            case .flood:
                return "Attention! There is flooding in this region. Take action for immediate evacuation to a higher point."
            case .fire:
                return "Attention! There is fire in this area. Take action for immediate evacuation to a safe location .."
            
            case .attack:
                return "Attention! There is a terrorist attack in this area. Take action for immediate evacuation to a safe location."
            
            case .gasLeak:
                return "Attention! There is a gas leak in the area. Turn off the central electricity and stop the local gas supply. Take action for immediate evacuation to a safe location."
            case .chemicalRisk:
                return "Attention! There is a chemical risk in this area. Take action for immediate evacuation to a safe location."
            case .earthquake:
                return "Attention! An earthquake in this region. Turn off the central electricity and stop the local gas supply. Take action for immediate evacuation to a safe location. Use only stairs."
            case .hail:
                return "Attention! There is a hail in this area. Take action for immediate evacuation to a safe location."
            case .landslide:
                return "Attention! There is a landslide in this area. Take action for immediate evacuation to a safe location."
            case .radiationRisk:
                return "Attention! There is a radiation risk in this area. Take action for immediate evacuation to a safe location."
        }
    }
    
    private func splitLocation(location: String){
        let charSet = CharacterSet(charactersIn: ", ()")
        let points = location.components(separatedBy: charSet)
        var tempArr: [String] = []
        for item in points{
            if !item.isEmpty{
                tempArr.append(item)
            }
        }
        print(tempArr)

        let firstValue  = Double(tempArr[0])!
        let secondValue = Double(tempArr[1])!
        
        self.location.0 = firstValue
        self.location.1 = secondValue
    }
}
