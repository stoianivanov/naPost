//
//  CustomNavigationBar.swift
//  OnPost
//
//  Created by Emil Iliev on 10/1/16.
//  Copyright © 2016 Marina Georgieva. All rights reserved.
//

import UIKit

protocol CustomNavBarDelegate{
    func reportAction()
}

class CustomNavigationBar: UINavigationBar{

    let titleLabel: UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.font = UIFont(name: "Roboto-Bold", size: 17)
        l.text = "OnPost"
        l.textAlignment = .center
        return l
    }()
    
    var navBarDelegate: CustomNavBarDelegate?
    
    lazy var reportButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont(name: "FontAwesome", size: 30)
        let title = String(format: "%C", 0xf06e)
        button.setTitleColor(.black, for: .normal)
        button.setTitle(title, for: .normal)
        button.addTarget(self, action: #selector(handleReport), for: .touchUpInside)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupBar()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupBar(){
        backgroundColor = UIColor(r: 255, g: 255, b: 255, alpha: 1)
        addSubview(titleLabel)
        self.addConstraint(NSLayoutConstraint(item: titleLabel, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0))
        self.addConstraintsWithFormat("H:|[v0]|", views: titleLabel)
        
        self.addSubview(reportButton)
        reportButton.widthAnchor.constraint(equalToConstant: 36).isActive = true
        reportButton.heightAnchor.constraint(equalToConstant: 36).isActive = true
        
        self.addConstraint(NSLayoutConstraint(item: reportButton, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0))
        self.addConstraint(NSLayoutConstraint(item: reportButton, attribute: .trailing, relatedBy: .equal, toItem: self, attribute: .trailing, multiplier: 1, constant: -8))
    }

    func handleReport(){
        navBarDelegate?.reportAction()
    }
}

protocol BackNavBarDelegate {
    func backAction()
}

class BackNavBar: CustomNavigationBar{
    
    lazy var backButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont(name: "FontAwesome", size: 30)
        let title = String(format: "%C", 0xf104)
        button.setTitleColor(.black, for: .normal)
        button.setTitle(title, for: .normal)
        button.addTarget(self, action: #selector(handleBack), for: .touchUpInside)
        return button
    }()
    
    var dataSource: BackNavBarDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setupBar() {
        super.setupBar()
        
        addSubview(backButton)
        backButton.widthAnchor.constraint(equalToConstant: 36).isActive = true
        backButton.heightAnchor.constraint(equalToConstant: 36).isActive = true
        
        self.addConstraint(NSLayoutConstraint(item: backButton, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0))
        self.addConstraint(NSLayoutConstraint(item: backButton, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1, constant: 8))
    }
    
    func handleBack(){
        dataSource?.backAction()
    }
    
    
}
