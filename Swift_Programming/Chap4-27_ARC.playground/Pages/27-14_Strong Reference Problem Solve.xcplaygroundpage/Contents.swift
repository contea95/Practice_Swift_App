class Person {
    let name: String
    let hobby: String?
    
    lazy var introduce: () -> String = { [unowned self] in
        var introduction: String = "My name is \(self.name)"
        
        guard let hobby = self.hobby else {
            return introduction
        }
        
        introduction += " "
        introduction += "My hobby is \(self.hobby)"
        
        return introduction
    }
    
    init(name: String, hobby: String? = nil) {
        self.name = name
        self.hobby = hobby
    }
    
    deinit {
        print("\(name) is being deinitalized")
    }
}

var yagom: Person? = Person(name: "yagom", hobby: "Eating")
print(yagom?.introduce())

yagom = nil
