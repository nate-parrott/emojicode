//
//  AppDelegate.swift
//  BaseEmoji
//
//  Created by Nate Parrott on 8/11/15.
//  Copyright © 2015 Nate Parrott. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet weak var window: NSWindow!

    
    func applicationDidFinishLaunching(aNotification: NSNotification) {
        _testEmojicode()
        let testData = "Hello, 🌍".dataUsingEncoding(NSUTF8StringEncoding)!
        print(testData.emojicodeString)
        
        print(NSData(bytes: [UInt8]([216, 58, 192, 14]), length: 4).emojicodeString)
        print(NSData(bytes: [UInt8]([0x21, 0xa1, 0x06, 0x47, 0x4e, 0x01, 0x63, 0xae, 0x71, 0xa2, 0xb8, 0xe2, 0x3c, 0x51, 0x87, 0x3e]), length: 16).emojicodeString)
    }

    func applicationWillTerminate(aNotification: NSNotification) {
        // Insert code here to tear down your application
    }

}

