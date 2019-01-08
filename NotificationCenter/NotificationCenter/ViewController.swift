//
//  ViewController.swift
//  NotificationCenter
//
//  Created by Admin on 08/01/19.
//  Copyright © 2019 VISHAL. All rights reserved.
//

import UIKit
import UserNotifications
class ViewController: UIViewController {
    
    @IBOutlet weak var helloLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.reloadNotify(_:)), name: NSNotification.Name("notify"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.reloadDataNotify(_:)), name: NSNotification.Name("objectData"), object: nil)
    }
    
    @objc func reloadNotify(_ notification: Notification){
        if ((notification.object as? String) != nil) {
            print("Success!", notification.object!)
            self.helloLabel.text = notification.object as? String
        }
    }
    
    @objc func reloadDataNotify(_ notification: Notification){
        if let data = notification.userInfo as? [String: Int]
        {
            for (name, score) in data
            {
                print("\(name) scored \(score) points!")
            }
        }
    }
}

