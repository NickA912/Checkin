//
//  AdminViewController.swift
//  CheckinKiosk
//
//  Created by anselmon on 1/29/20.
//  Copyright © 2020 Nick Anselmo. All rights reserved.
//

import Cocoa

class AdminViewController: NSViewController {

    @IBOutlet weak var BackButtonOutlet: NSButton!
    @IBOutlet weak var printLogs: NSButton!
    @IBOutlet weak var printUsers: NSButton!
    @IBOutlet weak var editLastUser: NSButton!
    @IBOutlet weak var saveLogs: NSButton!
    @IBOutlet weak var saveUsers: NSButton!
    @IBOutlet weak var clearLogs: NSButton!
    @IBOutlet weak var clearUsers: NSButton!
    @IBOutlet weak var loadLogs: NSButton!
    @IBOutlet weak var loadUsers: NSButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }
    
    @IBAction func BackButtonAction(_ sender: Any) {
        if let ViewController = self.storyboard?.instantiateController(withIdentifier: "ViewController") as? ViewController {
            self.view.window?.contentViewController = ViewController
        }
    }
    
    @IBAction func printLogsAction(_ sender: Any) {
        dataHandler.printLogs()
        print("all logs printed")
    }
    @IBAction func printUsersAction(_ sender: Any) {
        dataHandler.printUsers()
        print("all users printed")
    }
    @IBAction func editLastUserAction(_ sender: Any) {
        if let UserCreation = self.storyboard?.instantiateController(withIdentifier: "UserCreation") as? UserCreation {
            self.view.window?.contentViewController = UserCreation
        }
    }
    @IBAction func saveLogsAction(_ sender: Any) {
        dataHandler.saveLogs()
        print("logs saved to file")
    }
    @IBAction func saveUsersAction(_ sender: Any) {
        dataHandler.saveUsers()
        print("users saved to file")
    }
    @IBAction func clearLogsAction(_ sender: Any) {
        dataHandler.clearLogs()
        print("all logs cleared")
    }
    @IBAction func clearUsersAction(_ sender: Any) {
        dataHandler.clearUsers()
        print("all users cleared")
    }
    @IBAction func loadLogsAction(_ sender: Any) {
        dataHandler.loadLogs()
        print("logs loaded")
    }
    @IBAction func loadUsersAction(_ sender: Any) {
        dataHandler.loadUsers()
        print("users loaded")
    }
}
