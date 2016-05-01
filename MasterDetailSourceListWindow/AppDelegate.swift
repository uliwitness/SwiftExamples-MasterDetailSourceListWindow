//
//  AppDelegate.swift
//  MasterDetailSourceListWindow
//
//  Created by Uli Kusterer on 01/05/16.
//  Copyright © 2016 Uli Kusterer. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
	var helpWindow : MasterDetailSourceListWindowController?
	
	func applicationDidFinishLaunching(aNotification: NSNotification) {
		helpWindow = MasterDetailSourceListWindowController( viewControllers: [ RedTestViewController(title: "One")!, RedTestViewController(title: "Two")! ] )
		helpWindow!.showWindow( self )
	}

	func applicationWillTerminate(aNotification: NSNotification) {
		// Insert code here to tear down your application
	}


}

