enum Gender {
    case male, female, unknown
}

struct Friend {
    let name: String
    let gender: Gender
    let location: String
    var age: UInt
}
var friends: [Friend] = [Friend]()

friends.append(Friend(name: "Y", gender: .male, location: "발리", age: 26))
friends.append(Friend(name: "Ji", gender: .male, location: "시드니", age: 24))
friends.append(Friend(name: "Ju", gender: .male, location: "경기", age: 30))
friends.append(Friend(name: "Jiyoung", gender: .female, location: "서울", age: 36))
friends.append(Friend(name: "Yu", gender: .male, location: "충북", age: 20))
friends.append(Friend(name: "Yun", gender: .female, location: "대전", age: 29))
friends.append(Friend(name: "Young", gender: .male, location: "경기", age: 24))

// 서울 외에 25세 이상 친구
var result: [Friend] = friends.map { Friend(name: $0.name, gender: $0.gender, location: $0.location, age: $0.age + 1) }

result = result.filter{ $0.location != "서울" && $0.age >= 25 }

let string: String = result.reduce("서울 외에 25이상인 친구 : ") {$0 + "\n" + "\($1.name) \($1.gender) \($1.location) \($1.age)"}

print(string)
