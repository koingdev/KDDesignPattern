import UIKit

////////////////////////////////////////////////////////////////
//MARK: -
//MARK: Factory Method Pattern
//MARK: -
////////////////////////////////////////////////////////////////

// Example

enum CarType {
	case lamborghini
	case ferrari
}

protocol Car {
	func run()
}

class Lamborghini: Car {
	func run() {
		print("\(Lamborghini.self)")
	}
}

class Ferrari: Car {
	func run() {
		print("\(Ferrari.self)")
	}
}

class CarFactory {
	
	// return object based on the param
	static func create(carType: CarType) -> Car {
		switch carType {
		case .lamborghini:
			return Lamborghini()
		case .ferrari:
			return Ferrari()
		}
	}
	
}

// Usage

let lamborghini = CarFactory.create(carType: .lamborghini)
let ferrari = CarFactory.create(carType: .ferrari)



////////////////////////////////////////////////////////////////
//MARK: -
//MARK: Singleton Pattern
//MARK: -
////////////////////////////////////////////////////////////////

// Example

class Database {
	
	static let instance = Database()
	
	private init() {
		// to prevent 2nd initialization
	}
	
	func write() {
		print("Writing datatase")
	}
	
}

// Usage

Database.instance.write()



////////////////////////////////////////////////////////////////
//MARK: -
//MARK: Builder Pattern
//MARK: -
////////////////////////////////////////////////////////////////

// Example

extension UILabel {
	
	class Builder {
		
		// Component we want to build part by part
		private let label = UILabel(frame: .zero)
		
		func withBackgroundColor(_ color: UIColor) -> Self {
			label.backgroundColor = color
			return self
		}
		
		func withTextColor(_ color: UIColor) -> Self {
			label.textColor = color
			return self
		}
		
		func withFont(_ font: UIFont) -> Self {
			label.font = font
			return self
		}
		
		func withFrame(_ frame: CGRect) -> Self {
			label.frame = frame
			return self
		}
		
		func setText(_ text: String) -> Self {
			label.text = text
			return self
		}
		
		func build() -> UILabel {
			return label
		}
		
	}
	
}

// Usage

let label = UILabel.Builder()
					.withFont(.boldSystemFont(ofSize: 18))
					.withBackgroundColor(.green)
					.withTextColor(.white)
					.withFrame(.zero)
					.setText("Builder Pattern")
					.build()
