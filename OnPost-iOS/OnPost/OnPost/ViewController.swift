//
//  ViewController.swift
//  OnPost
//
//  Created by Marina Georgieva on 10/1/16.
//  Copyright © 2016 Marina Georgieva. All rights reserved.
//

import UIKit

class ViewController: CustomVC, UITableViewDataSource, UITableViewDelegate{
    
    let DISASTER_CELL = "DisasterCell"
    
    let disasters: [Disaster] = [ Disaster(type: .flood),
                                  Disaster(type: .fire),
                                  Disaster(type: .gasLeak),
                                  Disaster(type: .attack),
                                  Disaster(type: .flood),
                                  Disaster(type: .fire),
                                  Disaster(type: .attack),
                                  Disaster(type: .gasLeak)]
    
    
    lazy var tableView: UITableView = {
        let table = UITableView()
        table.rowHeight = UITableViewAutomaticDimension
        table.translatesAutoresizingMaskIntoConstraints = false
        table.delegate = self
        table.dataSource = self
        table.separatorStyle = .singleLine
        table.register(DisasterCell.self, forCellReuseIdentifier: self.DISASTER_CELL)
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        view.addSubview(tableView)
        view.addConstraintsWithFormat("V:|-64-[v0]-49-|", views: tableView)
        view.addConstraintsWithFormat("H:|[v0]|", views: tableView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //MARK: - UITableViewDataSource & Delegate
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return disasters.count
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DISASTER_CELL) as! DisasterCell
        cell.disaster = disasters[indexPath.item]
        return cell
    }
    
}

