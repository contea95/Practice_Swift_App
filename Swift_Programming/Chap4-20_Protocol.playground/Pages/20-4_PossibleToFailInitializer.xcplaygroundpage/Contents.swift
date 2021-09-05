protocol Named {
    var name: String { get }
    
    init?(name: String)
}

struct Animal: Named {
    var name: String
    
    init!(name: String) {
        self.name = name
    }
}

struct Pet: Named {
    var name: String
    
    init(name: String) {
        self.name = name
    }
}

class Person: Named {
    var name: String
    
    required init(name: String) {
        self.name = name
    }
}

class School: Named {
    var name: String
    
    required init?(name: String) {
        self.name = name
    }
}
