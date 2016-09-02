//
//  AppDelegate.swift
//  GenericTableView
//
//  Created by Benni on 17.08.16.
//  Copyright © 2016 Ben Boecker. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

	var window: UIWindow? = UIWindow(frame: UIScreen.mainScreen().bounds)

	func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {

		let cats = Cat.allCats
		let catViewController = GenericTableViewController<CatTableViewCell>(data: cats)
		catViewController.tableView.estimatedRowHeight = 60
		catViewController.tableView.rowHeight = UITableViewAutomaticDimension
		catViewController.title = "Cats"

		self.window?.rootViewController = UINavigationController(rootViewController: catViewController)
		self.window?.makeKeyAndVisible()

		return true
	}

}

