//
//  RedTestViewController.swift
//  MasterDetailSourceListWindow
//
//  Created by Uli Kusterer on 01/05/16.
//  Copyright © 2016 Uli Kusterer. All rights reserved.
//

import Cocoa

class RedTestViewController: NSViewController {
	init?( title inTitle: String ) {
		super.init(nibName: nil, bundle: nil)
		self.title = inTitle
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }
    
}
