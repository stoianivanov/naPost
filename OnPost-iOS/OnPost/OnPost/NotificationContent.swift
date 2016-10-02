
//
//  NotificationContent.swift
//  OnPost
//
//  Created by Marina Georgieva on 10/2/16.
//  Copyright © 2016 Marina Georgieva. All rights reserved.
//


import Foundation
import UserNotifications

final class NotificationContent: UNMutableNotificationContent {
    init(title: String, subTitle: String, body: String) {
        super.init()
        self.title = title
        self.subtitle = subTitle
        self.body = body
        self.sound = UNNotificationSound.default()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

