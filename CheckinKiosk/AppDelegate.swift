//
//  AppDelegate.swift
//  CheckinKiosk
//
//  Created by Nick Anselmo on 11/8/19.
//  Copyright © 2019 Nick Anselmo. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {



    func applicationDidFinishLaunching(_ aNotification: Notification) {
        //dataHandler.addTestUsers()
        //dataHandler.saveUsers()
        dataHandler.loadUsers()
        dataHandler.printUsers()
        
        //dataHandler.addTestLogs()
        //dataHandler.saveLogs()
        dataHandler.loadLogs()
        dataHandler.printLogs()
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }


}

