
////////////////////////////////////////////////////////////////
//MARK: -
//MARK: Decorator
//MARK: -
////////////////////////////////////////////////////////////////

// Example

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



////////////////////////////////////////////////////////////////
//MARK: -
//MARK: Flyweight
//MARK: -
////////////////////////////////////////////////////////////////

// Example

final class Car {
	
	var name: String
	
	init(name: String) {
		self.name = name
	}
	
}

// Create and cache Car for future use
final class FlyweightCar {
	
	// Flyweight objects
	var cars: [String : Car] = [:]
	
	// If brand name already exists, return cache
	// Otherwise create and return new one
	func getCarByBrand(name: String) -> Car {
		if let cacheCar = cars[name] {
			return cacheCar
		} else {
			let car = Car(name: name)
			cars[name] = car
			return car
		}
	}
	
}

// Usage

let people = FlyweightCar()
// create new car BMW
let bmw1 = people.getCarByBrand(name: "BMW")
// get from the cache and reuse
let bmw2 = people.getCarByBrand(name: "BMW")
