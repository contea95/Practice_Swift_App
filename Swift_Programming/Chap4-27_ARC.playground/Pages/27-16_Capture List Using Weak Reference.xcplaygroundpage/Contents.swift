class Person {
    let name: String
    let hobby: String?
    
    lazy var introduce: () -> String = { [weak self] in
        guard let `self` = self else {
            return "원래의 참조 인스턴스가 없어졌습니다."
        }
        
        var introduction: String = "My name is \(self.name)"
        
        guard let hobby = self.hobby else {
            return introduction
        }
        
        introduction += " "
        introduction += "My hobby is \(hobby)"
        
        return introduction
    }
    
    init(name: String, hobby: String?){
        self.name = name
        self.hobby = hobby
    }
    
    deinit {
        print("\(name) is being deinitalized")
    }
}

var yagom: Person? = Person(name: "yagom", hobby: "Eating")
var hana: Person? = Person(name: "hana", hobby: "Playing")

hana?.introduce = yagom?.introduce ?? {" "}

print(yagom?.introduce())

yagom = nil

print(hana?.introduce())
