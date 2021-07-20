public struct SomeType {
    private var privateVariable = 0
    fileprivate var fileprivateVariable = 0
}

extension SomeType {
    public func publicMethod() {
        print("\(self.privateVariable), \(self.fileprivateVariable)")
    }
    
    private func privateMethod() {
        print("\(self.privateVariable), \(self.fileprivateVariable)")
    }
    
    fileprivate func fileprivateMethod() {
        print("\(self.privateVariable), \(self.fileprivateVariable)")
    }
}

struct AnotherType {
    var someInstance: SomeType = SomeType()
    
    mutating func someMethod() {
        self.someInstance.publicMethod()
        
        self.someInstance.fileprivateVariable = 100
        self.someInstance.fileprivateMethod()
        
//        self.someInstance.privateVariable = 100
//        self.someInstance.privateMethod()
    }
}

var anotherInstance = AnotherType()
anotherInstance.someMethod()
