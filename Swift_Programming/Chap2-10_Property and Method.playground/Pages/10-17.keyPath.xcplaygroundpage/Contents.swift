struct Person {
    let name: String
    let nickName: String?
    let age: Int
    
    var isAdult: Bool {
        return age > 18
    }
}

let yagom: Person = Person(name: "yagom", nickName: "bear", age: 100)
let hana: Person = Person(name: "hana", nickName: "na", age: 100)
let happy: Person = Person(name: "happy", nickName: nil, age: 3)

let family: [Person] = [yagom, hana, happy]
let names: [String] = family.map(\.name)
let nicknames: [String] = family.compactMap(\.nickName)
let adults: [String] = family.filter(\.isAdult).map(\.name)

