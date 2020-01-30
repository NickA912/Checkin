//
//  ViewController.swift
//  CheckinKiosk
//
//  Created by Nick Anselmo on 11/8/19.
//  Copyright © 2019 Nick Anselmo. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    @IBOutlet weak var GuestCheckinButtonOutlet: NSButton!
    
    @IBOutlet weak var AdminButtonOutlet: NSButton!
    
    var keyIsDown=false
    var loginData=""
    var timer=Timer()
    var userID=""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NSEvent.addLocalMonitorForEvents(matching: .keyDown) {
            if self.myKeyDown(with: $0) {
                return nil
            } else {
                return $0
            }
        }

        // Do any additional setup after loading the view.
    }
    
    func myKeyDown(with event: NSEvent) -> Bool {
        timer.invalidate()
        timer=Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(timerAction), userInfo: nil, repeats:true)
        loginData+=event.characters!
        if (event.keyCode==36 && loginData.count==11) {
            dataHandler.addLog(ID: String(loginData.dropLast()))
            if (dataHandler.checkUser(ID: String(loginData.dropLast()))==true) {
                print("Thank you for checking in!")
            }
            else {
                print("New User")
                if let UserCreation = self.storyboard?.instantiateController(withIdentifier: "UserCreation") as? UserCreation {
                    self.view.window?.contentViewController = UserCreation
                }
            }
        }
        return false
    }

    @objc func timerAction() {
        timer.invalidate()
        loginData=""
    }
    
    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    @IBAction func GuestCheckinButtonPress(_ sender: Any) {
        if let GuestCheckin = self.storyboard?.instantiateController(withIdentifier: "GuestCheckin") as? GuestCheckin {
            self.view.window?.contentViewController = GuestCheckin
        }
    }
    
    @IBAction func AdminButtonAction(_ sender: Any) {
        if let AdminViewController = self.storyboard?.instantiateController(withIdentifier: "AdminViewController") as? AdminViewController {
            self.view.window?.contentViewController = AdminViewController
        }
    }
}

