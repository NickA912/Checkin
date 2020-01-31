//
//  UserCreation.swift
//  CheckinKiosk
//
//  Created by anselmon on 1/27/20.
//  Copyright © 2020 Nick Anselmo. All rights reserved.
//

import Cocoa

class UserCreation: NSViewController {

    @IBOutlet weak var CancelButtonOutlet: NSButton!
    @IBOutlet weak var SubmitButtonOutlet: NSButton!
    @IBOutlet weak var FirstNameField: NSTextField!
    @IBOutlet weak var LastNameField: NSTextField!
    @IBOutlet weak var ComputingIDField: NSTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        if (dataHandler.checkUser(ID: dataHandler.getLastLog())) {
            print("edit existing user")
            let tempUser=dataHandler.returnUser(ID: dataHandler.getLastLog())
            FirstNameField.stringValue=tempUser.firstName
            LastNameField.stringValue=tempUser.lastName
            ComputingIDField.stringValue=tempUser.computingID
        }
    }
    
    @IBAction func CancelButtonAction(_ sender: Any) {
        if let ViewController = self.storyboard?.instantiateController(withIdentifier: "ViewController") as? ViewController {
            self.view.window?.contentViewController = ViewController
        }
    }
    
    @IBAction func SubmitButtonAction(_ sender: Any) {
        dataHandler.addUser(fname: FirstNameField.stringValue, lname: LastNameField.stringValue, ID: dataHandler.getLastLog(), computeID: ComputingIDField.stringValue, guest: false)
        
        if let ViewController = self.storyboard?.instantiateController(withIdentifier: "ViewController") as? ViewController {
            self.view.window?.contentViewController = ViewController
        }
    }
    
}
