class Person {
    let name: String
    init(name: String) {
        self.name = name
    }
}
struct Stuff {
    var name: String
    var owner: Person
}

let yagom = Person(name: "yagom")
let hana = Person(name: "hana")
let macbook = Stuff(name: "MacBook Pro", owner: yagom)
var iMac = Stuff(name: "iMac", owner: yagom)
let iPhone = Stuff(name: "iPhone", owner: hana)

let stuffNameKeyPath = \Stuff.name
let ownerKeyPath = \Stuff.owner

// \Stuff.owner.name
let ownerNameKeyPath = ownerKeyPath.appending(path: \.name)

print(macbook[keyPath: stuffNameKeyPath])

print(macbook[keyPath: ownerNameKeyPath])

iMac[keyPath: stuffNameKeyPath] = "iMac Pro"
iMac[keyPath: ownerKeyPath] = hana

