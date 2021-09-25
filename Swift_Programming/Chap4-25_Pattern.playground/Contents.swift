protocol Personalize {
    var name: String { get }
    var age: Int { get }
}

struct Person: Personalize {
    var name: String
    var age: Int
}

let star: Person = Person(name: "Star", age: 99)

func ~= <T: Personalize>(pattern: String, value: T) -> Bool {
    return pattern == value.name
}

func ~= <T: Personalize>(pattern: T, value: T) -> Bool {
    return pattern.name == value.name
}

switch star {
case Person(name: "Star", age: 99): print("Same Person")
case "Star": print("Hello Star")
default: print("I don't know who you are")
}

func ~= <T:Personalize>(pattern: (T) -> Bool, value: T) -> Bool {
    return pattern(value)
}

func young<T: Personalize>(value: T) -> Bool {
    return value.age < 50
}

switch star {
case young: print("\(star.name) is young")
default: print("\(star.name) is old")
}

func isNamed<T: Personalize>(_ pattern: String) -> ((T) -> Bool) {
    return { (value: T) -> Bool in value.name == pattern }
}

switch star {
case isNamed("Jung"): print("He is Jung")
default: print("Another Person")
}

prefix operator ==?

prefix func ==? <T: Personalize>(pattern: String) -> ((T) -> Bool) {
    return isNamed(pattern)
}

switch star {
case ==?("Jung"): print("He is Jung")
default: print("Another Person")
}
