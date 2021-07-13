func someFunction(paramA: Any, paramB: Any) {
    print("someFunction called..")
}

var functionReference = someFunction(paramA:paramB:)

functionReference("a", "b")

class Person {
    var name: String
    
    init(name: String) {
        self.name = name
    }
}

struct Stuff {
    var name: String
    var owner: Person
}

print(type(of: \Person.name))
print(type(of: \Stuff.name))

let keyPath = \Stuff.owner
let nameKeyPath = keyPath.appending(path: \.name)

print(nameKeyPath)
