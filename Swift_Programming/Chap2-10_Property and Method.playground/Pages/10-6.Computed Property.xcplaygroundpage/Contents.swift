struct CoordinatePoint {
    var x: Int
    var y: Int
    
    var oppositePoint: CoordinatePoint {    // 연산 프로퍼티
        // 접근자
        get {
            return CoordinatePoint(x: -x, y: -y)
        }
        
        // 설정자
        set(opposite) {
            x = -opposite.x
            y = -opposite.y
        }
    }
}

var yagomPosition: CoordinatePoint = CoordinatePoint(x: 10, y: 20)
print(yagomPosition)
print(yagomPosition.oppositePoint)

yagomPosition.oppositePoint = CoordinatePoint(x: 15, y: 10)

print(yagomPosition)
