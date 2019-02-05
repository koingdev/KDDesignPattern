# CREATIONAL
> Creational software design patterns deal with object creation mechanisms
## Factory Method
*Should be applied when:*
* We have a superclass with multiple subclasses and we need to return one of the subclass based on the parameter
* We want to separates the code of instantiation a class to the Factory class (Loose Coupling)

*How it solves the problem:*
* Provides a static method with return-type of superclass or protocol and return a specific object based on the parameter

### Example
```swift
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
```
## Singleton
*Should be applied when:*
* We want to create one object and globally use it the whole time
* We don’t want to create the same object again and again
* Do not overuse this pattern 🙂

*How it solves the problem:*
* A class contains one global shared instance property
* Use private constructor to ensure that the object can only be instantiated once

### Example
```swift
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
```
## Builder
*Should be applied when:*
* You need to compose complex objects
* Object contains a lot of properties
* A constructor has too many parameters, it gets difficult to read and manage

*How it solves the problem:*
* Use an inner-class Builder to create the object part-by-part and provide a method that will return the final object

### Example
```swift
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
```
# STRUCTURAL
> Structural software design patterns deal with class structure mechanisms
## Decorator
*Should be applied when:*
* We want to extend or modify the functionality of object at runtime without affecting the original object
* We don’t want to modify the behavior using Inheritance
* Inheritance sometimes leads to complex and complicated structure
* Composition over Inheritance :)

*How it solves the problem:*
* Wrapping an object with Decorator class

### Example
```swift
protocol Computer {
	var cost: Double { get }
	var description: String { get }
}

// Class we want to decorate
class DesktopComputer: Computer {
	var cost: Double {
		return 300
	}
	var description: String {
		return "Desktop Computer"
	}
}

// All decorators will inherite this class
class DesktopComputerDecorator: Computer {

	// Object to be decorated
	let computer: Computer

	var cost: Double {
		return computer.cost
	}
	var description: String {
		return computer.description
	}

	init(computer: Computer) {
		self.computer = computer
	}

}

// Decorators

final class ProcessorUpgrade: DesktopComputerDecorator {

	override var cost: Double {
		return computer.cost + 100
	}
	override var description: String {
		return computer.description + ", core i7"
	}

	override init(computer: Computer) {
		super.init(computer: computer)
	}

}

final class GraphicCardUpgrade: DesktopComputerDecorator {

	override var cost: Double {
		return computer.cost + 50
	}
	override var description: String {
		return computer.description + ", NVIDIA GTX 1080"
	}

	override init(computer: Computer) {
		super.init(computer: computer)
	}

}

// Usage
var desktop: Computer = DesktopComputer()

// decorate
desktop = ProcessorUpgrade(computer: desktop)
desktop = GraphicCardUpgrade(computer: desktop)

// or
//desktop = ProcessorUpgrade(computer: GraphicCardUpgrade(computer: desktop))

print(desktop.description + ", $\(desktop.cost)")
```
