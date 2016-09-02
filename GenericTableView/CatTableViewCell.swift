//
//  CatTableViewCell.swift
//  GenericTableView
//
//  Created by Benni on 17.08.16.
//  Copyright © 2016 Ben Boecker. All rights reserved.
//

import UIKit

/**
This subclass of `UITableViewCell` implements the `ReusableTableViewCell` protocol to be used in the `GenericTableViewController`.
*/
class CatTableViewCell: UITableViewCell, ReusableTableViewCell {

	/// Label outlet for the cat's name
	@IBOutlet weak var catNameLabel: UILabel!
	/// Label outlet for the cat's age
	@IBOutlet weak var catAgeLabel: UILabel!

	/// Must be implemented to conform to the `ReusableTableViewCell` protocol. Defines the cells data type to be of the `Cat` struct. 
	typealias Type = Cat

	/**
	Must be implemented to conform to the `ReusableTableViewCell` protocol. Populates the two labels with the neccessary information from the data object.
	
	- paramater data: An object of type `Cat`, containing the information to populate the labels.
	*/
	func configureCell(data: Cat) {
		self.catNameLabel.text = data.name
		self.catAgeLabel?.text = "\(data.age) years old"
	}
}
