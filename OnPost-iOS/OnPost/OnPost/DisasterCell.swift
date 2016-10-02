//
//  DisasterCell.swift
//  OnPost
//
//  Created by Emil Iliev on 10/1/16.
//  Copyright © 2016 Marina Georgieva. All rights reserved.
//

import UIKit

class DisasterCell: UITableViewCell{
    
    var disaster: Disaster?{
        didSet{
            guard let unwarpDisaster = disaster
                else{
                    return
            }
            
            cellTitle.text = unwarpDisaster.getTitleForType()
            descriptionLabel.text = unwarpDisaster.descriptionForType()
            
            disasterImageLabel.textColor = unwarpDisaster.getLevelColor()
        }
    }
    
    let cellTitle: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Roboto-Bold", size: 17)
        label.textColor = UIColor(r: 51, g: 51, b: 51, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Atentat"
        label.textAlignment = .left
        return label
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Roboto", size: 15)
        label.textColor = UIColor(r: 51, g: 51, b: 51, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "FU kaByym"
        label.numberOfLines = 0
        return label
    }()
    
    let disasterImageLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "FontAwesome", size: 22)
        label.translatesAutoresizingMaskIntoConstraints = false
        let text = String(format: "%C", 0xf111)
        label.text = text
        return label
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCell()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCell(){
        addSubview(cellTitle)
        addSubview(descriptionLabel)
        addSubview(disasterImageLabel)
        
        //DisasterImageLabel Cosntraints
        disasterImageLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        disasterImageLabel.widthAnchor.constraint(equalToConstant: 30).isActive = true
        
        //cellTitle
        self.addConstraintsWithFormat("H:|-20-[v0]-8-[v1]-20-|", views: cellTitle, disasterImageLabel)
        self.addConstraintsWithFormat("H:|-20-[v0]-20-|", views: descriptionLabel)
        
        self.addConstraintsWithFormat("V:|-8-[v0]-8-[v1]-8-|", views: cellTitle ,descriptionLabel)
        self.addConstraint(NSLayoutConstraint(item: disasterImageLabel, attribute: .centerY, relatedBy: .equal, toItem: cellTitle , attribute: .centerY, multiplier: 1, constant: 0))
    }
    
    
}


