struct BasicInfomation {
    let name: String
    var age: Int
}

var yagomInfo: BasicInfomation = BasicInfomation(name: "yagom", age: 99)
yagomInfo.age = 100

var friendInfo: BasicInfomation = yagomInfo

print("yagom's age: \(yagomInfo.age)")
print("friend's age: \(friendInfo.age)")

friendInfo.age = 999

print("yagom's age: \(yagomInfo.age)")
print("friend's age: \(friendInfo.age)")

class Person {
    var height: Float = 0.0
    var weight: Float = 0.0
}

var yagom: Person = Person()
var friend: Person = yagom

print("yagom's height: \(yagom.height)")
print("friend's height: \(friend.height)")

friend.height = 185.5
print("yagom's height: \(yagom.height)")
// 185.5 - friend가 yagom을 참조하기 때문에 값이 변동된다.

func changeBasicInfo(_ info: BasicInfomation) {
    var copiedInfo: BasicInfomation = info
    copiedInfo.age = 1
}

func changePersonInfo(_ info: Person) {
    info.height = 155.3
}

changeBasicInfo(yagomInfo)
// 전달되는 인자로 값이 복사되어 전달되어서 최종적으로 yagomInfo에 영향을 주지 않는다.
print("yagom's age: \(yagomInfo.age)")

changePersonInfo(yagom)
print("yagom's height: \(yagom.height)")

