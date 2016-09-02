//
//  ViewController.swift
//  GenericTableView
//
//  Created by Benni on 17.08.16.
//  Copyright © 2016 Ben Boecker. All rights reserved.

import UIKit

/**
Generic implementation of a simple table view controller that provides all neccessary methods. The generic parameter is a `UITableViewCell` that must conform to the `ReusableTableViewCell` protocol. Cannot be used with storyboards.
*/
class GenericTableViewController<Cell: UITableViewCell where Cell: ReusableTableViewCell>: UITableViewController {
	/// Convenience typealias to the data type provided by the cell implementation.
	typealias DataType = Cell.DataType
	/// The array containing the data that is displayed in the table view.
	var data: [DataType] = []

	/**
	Custom initializer that takes an array of data objects to display in the table view.
	
	- parameter data: An array of objects of the type defined in the generic table view cell.
	- parameter style: An optional parameter containing the `UITableViewStyle` that should be used to display the table view. Defaults to `.Plain` (Swift 2.x).
	*/
	init(data: [DataType], style: UITableViewStyle = .Plain) {
		self.data = data
		super.init(style: style)
	}

	/**
	Overridden `UIViewController` method. Registers the generic table view cell for reuse in the table view.
	*/
	override func viewDidLoad() {
		super.viewDidLoad()

		self.tableView.registerReuseableCell(Cell.self)
	}

	/**
	Overridden `UITableViewController` method.
	*/
	override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return self.data.count
	}

	/**
	Overridden `UITableViewController` method.
	*/
	override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
		guard let cell: Cell = tableView.dequeueReuseableCell(indexPath: indexPath) else {
			return UITableViewCell()
		}

		cell.configureCell(self.data[indexPath.row])

		return cell
	}
}

/**
A private extension on `UITableView` to register and deque a generic table view cell conforming to the `ReusableTableViewCell` protocol.
*/
private extension UITableView {
	/**

	- parameter cellType:
	*/
	func registerReuseableCell<Cell: UITableViewCell where Cell: ReusableTableViewCell>(cellType: Cell.Type) {
		if let nib = Cell.nib {
			self.registerNib(nib, forCellReuseIdentifier: Cell.reuseIdentifier)
		} else {
			self.registerClass(Cell.self, forCellReuseIdentifier: Cell.reuseIdentifier)
		}
	}

	/**
	
	- parameter indexPath:
	- returns:
	*/
	func dequeueReuseableCell<Cell: UITableViewCell where Cell: ReusableTableViewCell>(indexPath indexPath: NSIndexPath) -> Cell? {
		return self.dequeueReusableCellWithIdentifier(Cell.reuseIdentifier, forIndexPath: indexPath) as? Cell
	}
}

/**

*/
protocol ReusableTableViewCell {
	///
	associatedtype DataType: Any

	///
	static var reuseIdentifier: String { get }
	///
	static var nib: UINib? { get }

	/**

	- parameter data:
	*/
	func configureCell(data: DataType)
}

/**
An extension on the `ReusableTableViewCell` protocol with a constraint on the implementing class being a subclass of `UITableViewCell`. Implements the `reuseIdentifier` and `nib` properties based on the class's name.
*/
extension ReusableTableViewCell where Self: UITableViewCell {
	/// Default implementation for the property `reuseIdentifier`
	static var reuseIdentifier: String {
		return String(Self)
	}
	/// Default implementation for the property `nib`, returns an optional `UINib` based on the cell's class name.
	static var nib: UINib? {
		return UINib(nibName: String(Self), bundle: nil)
	}
}


