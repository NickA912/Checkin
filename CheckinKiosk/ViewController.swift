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
    var keyIsDown=false
    override func viewDidLoad() {
        super.viewDidLoad()
        NSEvent.addLocalMonitorForEvents(matching: .keyDown) { (aEvent) -> NSEvent? in
            self.keyDown(with: aEvent)
            return aEvent
        }

        // Do any additional setup after loading the view.
    }
    
    override func keyDown(with event: NSEvent) {
       if keyIsDown == true {
           return
       }
       keyIsDown = true
       if event.keyCode == 1 {
           print("s key pressed")
       } else if event.keyCode == 49 {
           print("spacebar pressed")
       }
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

