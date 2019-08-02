//
//  NotificationViewController.swift
//  content
//
//  Created by chander bhushan on 31/07/19.
//  Copyright © 2019 innovationm. All rights reserved.
//

import UIKit
import UserNotifications
import UserNotificationsUI

class NotificationViewController: UIViewController, UNNotificationContentExtension {

    //@IBOutlet var label: UILabel?
    @IBOutlet weak var labelCandidateName: UILabel!
    @IBOutlet weak var labelHigherQualification: UILabel!
    @IBOutlet weak var labelInterviewTime: UILabel!
    @IBOutlet weak var labelInterviewDate: UILabel!
    @IBOutlet weak var labelExperience: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any required interface initialization here.
    }
    
    func didReceive(_ notification: UNNotification) {
       // self.label?.text = notification.request.content.body
        let userInfo = notification.request.content.userInfo
        labelExperience.text                = userInfo["experience"] as! String
        labelCandidateName.text             = userInfo["cadidateName"] as! String
        labelInterviewDate.text             = userInfo["interviewDate"] as! String
        labelHigherQualification.text       = userInfo["higherQualification"] as! String
        labelInterviewTime.text             = userInfo["interviewTime"] as! String
    }

}
