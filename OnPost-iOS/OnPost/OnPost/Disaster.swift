//
//  Disaster.swift
//  OnPost
//
//  Created by Emil Iliev on 10/1/16.
//  Copyright © 2016 Marina Georgieva. All rights reserved.
//

import Foundation

enum DisasterType{
    case flood
    case fire
    case gasLeak
    case attack

}

class Disaster {
    
    var disasterType: DisasterType
    var radius: Int = 1000
    var location: (Double, Double)
    var description: String
    
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
        radius = disRadius
        location = (0, 0)
        splitLocation(location: disLoc)
    }
    
    
    func getTitleForType() -> String{
        switch disasterType{
            case .flood:
                return "НАВОДНЕНИЕ"
            case .fire:
                return "ПОЖАР"
            case .attack:
                return "АТЕНТАТ"
            case .gasLeak:
                return "ИЗТИЧАНЕ НА ГАЗ"
        }
    }

    func colorForDisasterType() -> Int{
        switch disasterType {
            case .flood:
                return 0x0000FF
            case .fire:
                return 0xFF0000
            case .attack:
                return 0xFFFF00
            case .gasLeak:
                return 0x008800
        }
    }
    
    func descriptionForType() -> String{
        switch disasterType {
            case .flood:
                return "Внимание! Има получен сигнал за наводнения в този район. Предприемете действия за незабавна евакуция на по-висока точка. "
            case .fire:
                return "Внимание! Има получен сигнал за пожар в този район. Предприемете действия за незабавна евакуция на безпасно място."
            
            case .attack:
                return "Внимание! Има получен сигнал за атенат в този район. Предприемете действия за незабавна евакуция на безпасно място."
            
            case .gasLeak:
                return "Внимание! Има получен сигнал за изтичане на газ в този район. Изключетете централното електричество и спрете локалното газоподаване. Предприемете действия за незабавна евакуция на безпасно място."
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
