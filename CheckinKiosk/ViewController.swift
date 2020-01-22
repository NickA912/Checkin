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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("test")

        // Do any additional setup after loading the view.
    }
    
    override func keyDown(with event: NSEvent)
    {
        super.keyDown(with: event)
        print("Key with number: \(event.keyCode) was pressed")
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
    
}

