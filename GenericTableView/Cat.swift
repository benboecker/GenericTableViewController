//
//  Cat.swift
//  GenericTableView
//
//  Created by Benni on 17.08.16.
//  Copyright © 2016 Ben Boecker. All rights reserved.
//

import UIKit

/**
Simple data struct with example data of cats.
*/
struct Cat {
	/// The cat's name.
	let name: String
	/// The cat's age.
	let age: Int

	/// A static var returning example data of some cats.
	static var allCats: [Cat] {
		return [
			Cat(name: "Felix", age: 5),
			Cat(name: "Sheba", age: 6),
			Cat(name: "Mia", age: 8),
			Cat(name: "Fabian", age: 6),
			Cat(name: "Megabus", age: 5),
			Cat(name: "Timothy", age: 4),
			Cat(name: "Tommy", age: 2)
		]
	}
}
