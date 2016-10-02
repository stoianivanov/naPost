//
//  CustomVC.swift
//  OnPost
//
//  Created by Emil Iliev on 10/1/16.
//  Copyright © 2016 Marina Georgieva. All rights reserved.
//

import UIKit

class CustomVC: UIViewController, BackNavBarDelegate, CustomNavBarDelegate{
    
    lazy var navBar: BackNavBar = {
        let bar = BackNavBar()
        bar.dataSource = self
        bar.navBarDelegate = self
        bar.translatesAutoresizingMaskIntoConstraints = false
        return bar
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        navBar.backgroundColor = .white
        
        self.view.addSubview(navBar)
        self.view.addConstraintsWithFormat("H:|[v0]|", views: navBar)
        navBar.heightAnchor.constraint(equalToConstant: 44).isActive = true
        self.view.addConstraint(NSLayoutConstraint(item: navBar, attribute: .top, relatedBy: .equal, toItem: self.view, attribute: .top, multiplier: 1, constant: 20))
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func backAction(){
        self.navigationController?.popViewController(animated: true)
    }
    
    func reportAction() {
        let report = ReportVC()
        navigationController?.pushViewController(report, animated: true)
    }

}
