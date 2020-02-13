//
//  dataHandler.swift
//  CheckinKiosk
//
//  Created by anselmon on 1/26/20.
//  Copyright © 2020 Nick Anselmo. All rights reserved.
//

import Foundation

struct User: Codable, Hashable {
    var firstName: String
    var lastName: String
    var computingID: String
    var isGuest: Bool
}

struct Log: Codable, Hashable {
    var userID: String
    var timestamp: Date
}

class dataHandler {
    
    static var Users = [String: User]()
    static var Logs = [Log]()
    static var adminLogin = false
    
    static func newUser(IDCode: String, firstName: String, lastName: String, computingID: String) {
        Users[IDCode]=User(firstName: firstName, lastName: lastName, computingID: computingID, isGuest: false)
    }
    
    static func saveUsers() {
        do {
            let fileURL = try FileManager.default
                .url(for: .applicationSupportDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
                .appendingPathComponent("Users.json")
            
            try JSONEncoder().encode(Users)
                .write(to: fileURL)
        } catch {
            print(error)
        }
    }
    
    static func loadUsers() {
        do {
            let fileURL = try FileManager.default
                .url(for: .applicationSupportDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
                .appendingPathComponent("Users.json")
            
            let data = try Data(contentsOf: fileURL)
            let users = try JSONDecoder().decode([String: User].self, from: data)
            Users=users
        } catch {
            print(error)
        }
    }
    
    static func saveLogs() {
        do {
            let fileURL = try FileManager.default
                .url(for: .applicationSupportDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
                .appendingPathComponent("Logs.json")
            
            try JSONEncoder().encode(Logs)
                .write(to: fileURL)
        } catch {
            print(error)
        }
    }
    
    static func loadLogs() {
        do {
            let fileURL = try FileManager.default
                .url(for: .applicationSupportDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
                .appendingPathComponent("Logs.json")
            
            let data = try Data(contentsOf: fileURL)
            let logs = try JSONDecoder().decode([Log].self, from: data)
            Logs=logs
        } catch {
            print(error)
        }
    }
    
    static func addLog(ID: String) {
        Logs.append(Log(userID: ID, timestamp: Date()))
    }
    
    static func addUser(fname: String, lname: String, ID: String, computeID: String, guest: Bool) {
        Users[ID]=User(firstName: fname, lastName: lname, computingID: computeID, isGuest: guest)
    }
    
    static func checkUser(ID: String) -> Bool {
        return Users[ID] != nil
    }
    
    static func getLastLog() -> String {
        return Logs.last?.userID ?? ""
    }
    
    static func returnUser(ID: String) -> User{
        return Users[ID] ?? User(firstName: "", lastName: "", computingID: "", isGuest: false)
    }
    
    static func clearLogs() {
        Logs.removeAll()
    }
    
    static func clearUsers() {
        Users.removeAll()
    }
    
    static func isAdmin() -> Bool {
        return adminLogin
    }
    
    static func clearAdmin() {
        adminLogin=false
    }
    
    static func setAdmin() {
        adminLogin=true
    }
    
    // Debug methods
    static func addTestUsers() {
        Users["1234567891"]=User(firstName: "Nick", lastName: "Anselmo", computingID: "nka6bv", isGuest: false)
        Users["1234567892"]=User(firstName: "Miller", lastName: "Garrett", computingID: "mcg5de", isGuest: false)
    }
    
    static func addTestLogs() {
        Logs.append(Log(userID: "1234567891", timestamp: Date()))
        Logs.append(Log(userID: "1234567892", timestamp: Date()))
    }
    
    static func printUsers() {
        print(Users)
    }
    
    static func printLogs() {
        print(Logs)
    }
}
