struct CoordinatePoint {
    var x: Int = 0
    var y: Int = 0
}

class Position {
    lazy var point : CoordinatePoint = CoordinatePoint()
    let name: String
    
    init(name: String) {
        self.name = name
    }
}

let yagomPosition: Position = Position(name: "yagom")

print(yagomPosition.point)

