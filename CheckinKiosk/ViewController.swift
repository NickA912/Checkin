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
    
    @IBOutlet weak var MainTextOutlet: NSTextField!
    
    var keyIsDown=false
    var loginData=""
    var timer=Timer()
    var timer2=Timer()
    var acceptInput=true
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
    }
    
    func myKeyDown(with event: NSEvent) -> Bool {
        timer.invalidate()
        timer=Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(timerAction), userInfo: nil, repeats:true)
        loginData+=event.characters!
        if (event.keyCode==36 && loginData.count==15 && acceptInput==true) {
            acceptInput=false
            timer2.invalidate()
            timer2=Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(timer2Action), userInfo: nil, repeats:true)
            dataHandler.addLog(ID: String(loginData.dropLast()))
            if (dataHandler.getLastLog() == "29420883602017") {
                dataHandler.setAdmin()
            }
            if (dataHandler.checkUser(ID: String(loginData.dropLast()))==true) {
                print("Thank you for checking in!")
                MainTextOutlet.stringValue="Thank you for checking in " + dataHandler.returnUser(ID: String(loginData.dropLast())).firstName + "!"
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
    
    @objc func timer2Action() {
        timer2.invalidate()
        acceptInput=true
        loginData=""
        MainTextOutlet.stringValue="Please scan ID card on the Barcode Scanner"
    }
    
    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    @IBAction func GuestCheckinButtonPress(_ sender: Any) {
        /*if let GuestCheckin = self.storyboard?.instantiateController(withIdentifier: "GuestCheckin") as? GuestCheckin {
            self.view.window?.contentViewController = GuestCheckin
        }*/
    }
    
    @IBAction func AdminButtonAction(_ sender: Any) {
        if (dataHandler.getLastLog()=="29420883602017" && dataHandler.isAdmin()) {
            dataHandler.clearAdmin()
            if let AdminViewController = self.storyboard?.instantiateController(withIdentifier: "AdminViewController") as? AdminViewController {
                self.view.window?.contentViewController = AdminViewController
            }
        }
    }
}

