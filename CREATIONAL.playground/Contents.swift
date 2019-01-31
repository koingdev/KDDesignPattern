
////////////////////////////////////////////////////////////////
//MARK: -
//MARK: Factory Method Pattern
//MARK: -
////////////////////////////////////////////////////////////////

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

// Car Factory
class CarFactory {
	static func create(carType: CarType) -> Car {
		switch carType {
		case .lamborghini:
			return Lamborghini()
		case .ferrari:
			return Ferrari()
		}
	}
}

let lamborghini = CarFactory.create(carType: .lamborghini)
let ferrari = CarFactory.create(carType: .ferrari)



////////////////////////////////////////////////////////////////
//MARK: -
//MARK: Singleton Pattern
//MARK: -
////////////////////////////////////////////////////////////////

class Database {
	static let instance = Database()
	
	private init() {
		// to prevent 2nd initialization
	}
	
	func write() {
		print("Writing datatase")
	}
}

Database.instance.write()


////////////////////////////////////////////////////////////////
//MARK: -
//MARK: Builder Pattern
//MARK: -
////////////////////////////////////////////////////////////////

class WebService {
	var header: String = ""
	var url: String = ""
	var param: String = ""
	var token: String = ""
	var type: String = ""
	
	class Builder {
		
		var webService = WebService()
		
		func withHeader(_ header: String) -> Self {
			webService.header = header
			return self
		}
		
		func withURLAndParam(url: String, param: String) -> Self {
			webService.url = url
			webService.param = param
			return self
		}
		
		func withToken(_ token: String) -> Self {
			webService.token = token
			return self
		}
		
		func contentType(_ type: String) -> Self {
			webService.type = type
			return self
		}
		
		func request() {
			print("\(webService.url) + \(webService.param) + \(webService.header) + \(webService.token)")
		}
		
	}
	
}
