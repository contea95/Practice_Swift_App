// Code 10-1

// 좌표
struct CoordinatePoint {
    var x: Int
    var y: Int
}

let yagomPoint: CoordinatePoint = CoordinatePoint(x: 10, y: 5)

class Position {
    var point: CoordinatePoint
    let name: String
    
    // 프로퍼티 기본값을 지정해주지 않으면 이니셜라이저로 따로 정의해줘야한다.
    init(name: String, currentPoint: CoordinatePoint) {
        self.name = name
        self.point = currentPoint
    }
}

let yagomPosition: Position = Position(name: "yagom", currentPoint: yagomPoint)


