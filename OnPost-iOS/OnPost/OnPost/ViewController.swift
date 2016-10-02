//
//  ViewController.swift
//  OnPost
//
//  Created by Marina Georgieva on 10/1/16.
//  Copyright © 2016 Marina Georgieva. All rights reserved.
//

import UIKit
import Firebase
import UserNotifications
import UserNotificationsUI


class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, CustomNavBarDelegate, UNUserNotificationCenterDelegate{
    
    let DISASTER_CELL = "DisasterCell"
    
    var disasters : [Disaster] = []

    lazy var navBar: CustomNavigationBar = {
        let nav = CustomNavigationBar()
        nav.navBarDelegate = self
        nav.translatesAutoresizingMaskIntoConstraints = false
        return nav
    }()
    
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
    
    lazy var testButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(notification), for: .touchUpInside)
        button.setTitle("Test it", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        view.addSubview(tableView)
//        view.addConstraintsWithFormat("V:|-64-[v0]-49-|", views: tableView)
        view.addConstraintsWithFormat("H:|[v0]|", views: tableView)
        
        view.addSubview(navBar)
        view.addSubview(testButton)
        view.addConstraintsWithFormat("V:|-20-[v0(44)][v1][v2(20)]|", views: navBar, tableView, testButton)
        view.addConstraintsWithFormat("H:|[v0]|", views: navBar)
        view.addConstraintsWithFormat("H:|[v0]|", views: testButton)
        loadDisasters()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.title = "OnPost"
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let disaster = disasters[indexPath.item]
        let detailDisaster = DetailDisasterViewController()
        detailDisaster.currentDisaster = disaster

         navigationController?.pushViewController(detailDisaster, animated: true)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
    func loadDisasters(){
        FIRDatabase.database().reference().child("disasters").queryOrdered(byChild: "approved").queryEqual(toValue: 1).observe(.childAdded, with: {
                (snapshot) in
            if let dict = snapshot.value as? NSDictionary{
                print(snapshot)
                let newDisaster = Disaster(dict: dict)
                if newDisaster != nil{
                    self.disasters.append(newDisaster!)
                    self.tableView.reloadData()
                
                }
            }
            
            }, withCancel: {
                (error) in
                print(error)
        })
    }

    func reportAction() {
        let report = ReportVC()
        navigationController?.pushViewController(report, animated: true)
    }
    
    func notification() {
        let content = NotificationContent(title: "Disaster", subTitle: "Fire", body: "Rila Mountain")
        content.categoryIdentifier = Consts.categoryIdentifier
        let request = UNNotificationRequest(identifier: Consts.requestIdentifier, content: content, trigger: nil)
        UNUserNotificationCenter.current().add(request) { error in
            UNUserNotificationCenter.current().delegate = self
            if (error != nil){
                //handle here
            }
        }
    }
    
    public func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Swift.Void) {
        completionHandler( [.alert, .badge, .sound])
    }
    
    public func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Swift.Void) {
        print("Tapped in notification")
    }
}



