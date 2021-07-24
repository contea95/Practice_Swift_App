typealias VoidVoidClosure = () -> Void

func functionWithNoescapeClosure(closure: VoidVoidClosure) {
    closure()
}

func functionWithEscapingClosure(completionHandler: @escaping VoidVoidClosure) -> VoidVoidClosure {
    return completionHandler
}

class SomeClass {
    var x = 10
    
    func runNoescapeClosure() {
        functionWithNoescapeClosure { x = 200 }
    }
    
    func runEscapingClosure() -> VoidVoidClosure {
        // 탈출클로저에서 명시적으로 self 사용
        return functionWithEscapingClosure { self.x = 100 }
    }
    
    func printX() -> Int {
        return self.x
    }
}
//
let instance: SomeClass = SomeClass()
instance.runNoescapeClosure()
print(instance.x)

let returnedClosure: VoidVoidClosure = instance.runEscapingClosure()
returnedClosure()
print(instance.x)

let printXClosure: Int = instance.printX()
