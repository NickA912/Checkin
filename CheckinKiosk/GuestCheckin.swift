//
//  GuestCheckin.swift
//  CheckinKiosk
//
//  Created by Nick Anselmo on 1/19/20.
//  Copyright © 2020 Nick Anselmo. All rights reserved.
//

import Cocoa

class GuestCheckin: NSViewController {

    @IBOutlet weak var CancelButtonOutlet: NSButton!
    @IBOutlet weak var SubmitButtonOutlet: NSButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }
    
    @IBAction func CancelButtonAction(_ sender: Any) {
        if let ViewController = self.storyboard?.instantiateController(withIdentifier: "ViewController") as? ViewController {
            self.view.window?.contentViewController = ViewController
        }
    }
    
}
