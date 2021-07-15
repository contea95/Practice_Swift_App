struct Area1 {
    var squareMeter: Double
    
    init() {
        squareMeter = 0.0
    }
}

let room1: Area1 = Area1()
print(room1.squareMeter)

struct Area2 {
    var squareMeter: Double = 0.0
}

let room2: Area2 = Area2()
print(room2.squareMeter)

struct Area {
    var squareMeter: Double
    
    init(fromPy py: Double) {
        squareMeter = py * 3.3058
    }
    
    init(fromSequareMeter squareMeter: Double) {
        self.squareMeter = squareMeter
    }
    
    init(value: Double) {
        squareMeter = value
    }
    
    init(_ value: Double) {
        squareMeter = value
    }
}

let roomOne: Area = Area(fromPy: 15.0)
print(roomOne.squareMeter)

let roomTwo: Area = Area(fromSequareMeter: 33.06)
print(roomTwo.squareMeter)

let roomThree: Area = Area(value: 30.0)
let roomFour: Area = Area(55.0)
