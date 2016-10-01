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
    
    init(type: DisasterType){
        self.disasterType = type
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
}
