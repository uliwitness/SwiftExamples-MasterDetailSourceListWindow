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
		helpWindow = MasterDetailSourceListWindowController( viewControllers: [ MasterSourceListItem( viewController: RedTestViewController(title: "Reddish")!, image: NSImage(named: NSImageNameHomeTemplate)!), MasterSourceListItem( viewController: GreenTestViewController(title: "Greenish")!, image: NSImage(named: NSImageNameColorPanel)!) ] )
		helpWindow!.showWindow( self )
	}

	func applicationWillTerminate(aNotification: NSNotification) {
		// Insert code here to tear down your application
	}


}

