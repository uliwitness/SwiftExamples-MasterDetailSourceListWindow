//
//  MasterDetailSourceListWindowController.swift
//  MasterDetailSourceListWindow
//
//  Created by Uli Kusterer on 01/05/16.
//  Copyright © 2016 Uli Kusterer. All rights reserved.
//

import Cocoa


public class MasterSourceListItem: NSObject {
	var	viewController: NSViewController?
	var image: NSImage?
	var isGroup: Bool = false
	public init( viewController inVC: NSViewController, image inImage: NSImage, group inIsGroup: Bool = false ) {
		super.init()
		viewController = inVC
		image = inImage
		isGroup = inIsGroup
	}
}

public class MasterDetailSourceListWindowController: NSWindowController, NSOutlineViewDelegate, NSOutlineViewDataSource {
	@IBOutlet weak var sourceListView: NSOutlineView!
	@IBOutlet weak var detailView: NSView!
	var viewControllers : [MasterSourceListItem] = []

	public init( viewControllers inViewControllers: [MasterSourceListItem] )
	{
		super.init( window: nil )
		
		viewControllers = inViewControllers;
	}
	
	required public init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override public var windowNibName: String? { get { return "MasterDetailSourceListWindowController" } }
	
    override public func windowDidLoad() {
        super.windowDidLoad()

		sourceListView.reloadData()
		sourceListView.selectRowIndexes( NSIndexSet(index: 0), byExtendingSelection: false );
        // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
    }
    
	public func outlineView(outlineView: NSOutlineView, numberOfChildrenOfItem item: AnyObject?) -> Int
	{
		if item == nil
		{
			return viewControllers.count;
		}
		else
		{
			return 0;
		}
	}
	
	public func outlineView(outlineView: NSOutlineView, child index: Int, ofItem item: AnyObject?) -> AnyObject
	{
		if item == nil
		{
			return viewControllers[index];
		}
		else
		{
			return NSNull()
		}
	}
	
	public func outlineView(outlineView: NSOutlineView, isItemExpandable item: AnyObject) -> Bool
	{
		return false
	}
	
	public func outlineView(outlineView: NSOutlineView, isGroupItem item: AnyObject) -> Bool
	{
		let isGroupBool : Bool = item.isGroup
		return isGroupBool
	}
	
	public func outlineView(outlineView: NSOutlineView, viewForTableColumn tableColumn: NSTableColumn?, item: AnyObject) -> NSView? {
		var cellIdentifier: String = "DataCell"
		if item.isGroup!
		{
			cellIdentifier = "HeaderCell"
		}
		let	cell : NSTableCellView = sourceListView.makeViewWithIdentifier( cellIdentifier, owner: self ) as! NSTableCellView
		cell.objectValue = item
		return cell
	}
	
	public func outlineViewSelectionDidChange(notification: NSNotification)
	{
		detailView.subviews.removeAll()
		
		if sourceListView.selectedRow >= 0
		{
			let nextViewController = viewControllers[sourceListView.selectedRow].viewController!
			let theView = nextViewController.view;
			detailView.addSubview(theView)
			
			
			detailView.addConstraints( NSLayoutConstraint.constraintsWithVisualFormat( "|[theView]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["theView": theView]) )
			detailView.addConstraints( NSLayoutConstraint.constraintsWithVisualFormat( "V:|[theView]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["theView": theView]) )

		}
	}
}
