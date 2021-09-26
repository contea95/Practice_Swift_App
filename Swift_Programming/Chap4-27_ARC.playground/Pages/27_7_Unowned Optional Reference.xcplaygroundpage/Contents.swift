class Person {
    let name: String
    
    var card: CreditCard?
    
    init(name: String) {
        self.name = name
    }
    
    deinit { print("\(name) is being deinitalized")}
}

class CreditCard {
    let number: UInt
    unowned let owner: Person
    
    init(number: UInt, owner: Person) {
        self.number = number
        self.owner = owner
    }
    
    deinit { print("Card #\(number) is being deinitalized")}
}

var jisoo: Person? = Person(name: "jisoo")

if let person: Person = jisoo {
    person.card = CreditCard(number: 1004, owner: person)
}

jisoo = nil
