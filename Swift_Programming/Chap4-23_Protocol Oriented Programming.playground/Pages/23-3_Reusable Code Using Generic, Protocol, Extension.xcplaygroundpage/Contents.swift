protocol SelfPrintable {
    func printSelf()
}

extension SelfPrintable where Self: Container {
    func printSelf() {
        print(items)
    }
}

protocol Container: SelfPrintable {
    associatedtype ItemType
    
    var items: [ItemType] { get set }
    var count: Int { get }
    
    mutating func append(item: ItemType)
    subscript(i: Int) -> ItemType { get }
}

extension Container {
    mutating func append(item: ItemType) {
        items.append(item)
    }
    
    var count: Int {
        return items.count
    }
    
    subscript(i: Int) -> ItemType {
        return items[i]
    }
}

protocol Popable: Container {
    mutating func pop() -> ItemType?
    mutating func push(_ item: ItemType)
}

extension Popable {
    mutating func pop() -> ItemType? {
        return items.removeLast()
    }
    
    mutating func push(_ item: ItemType) {
        self.append(item: item)
    }
}

protocol Insertable: Container {
    mutating func delete() -> ItemType?
    mutating func insert(_ item: ItemType)
}

extension Insertable {
    mutating func delete() -> ItemType? {
        return items.removeFirst()
    }
    
    mutating func insert(_ item: ItemType) {
        self.append(item: item)
    }
}

struct Stack<Element>: Popable {
    var items: [Element] = [Element]()
    
    func map<T>(transform: (Element) -> T) -> Stack<T> {
        var transformedStack: Stack<T> = Stack<T>()
        
        for item in items {
            transformedStack.items.append(transform(item))
        }
        
        return transformedStack
    }
    
    func filter(includeElement: (Element) -> Bool) -> Stack<Element> {
        var filteredStack: Stack<ItemType> = Stack<ItemType>()
        
        for item in items {
            if includeElement(item) {
                filteredStack.items.append(item)
            }
        }
        
        return filteredStack
    }

    func reduce<T>(_ initialResult: T, nextPartialResult: (T, Element) -> T) -> T {
        var result: T = initialResult
        
        for item in items {
            result = nextPartialResult(result, item)
        }
        
        return result
    }
}

struct Queue<Element>: Insertable {
    var items: [Element] = [Element]()
}

//var myIntStack: Stack<Int> = Stack<Int>()
//var myStringStack: Stack<String> = Stack<String>()
//var myIntQueue: Queue<Int> = Queue<Int>()
//var myStringQueue: Queue<String> = Queue<String>()
//
//myIntStack.push(3)
//myIntStack.printSelf()
//
//myIntStack.push(2)
//myIntStack.printSelf()

///
var myIntStack: Stack<Int> = Stack<Int>()
myIntStack.push(1)
myIntStack.push(3)
myIntStack.push(5)
myIntStack.printSelf()


var myStrStack: Stack<String> = myIntStack.map{ "\($0)"}
myStrStack.printSelf()


let filteredStack: Stack<Int> = myIntStack.filter{ (item: Int) -> Bool in
    return item < 5
}

filteredStack.printSelf()


let combinedInt: Int = myIntStack.reduce(100) { (result: Int, next: Int) -> Int in
    return result + next
}

print(combinedInt)

let combinedDouble: Double = myIntStack.reduce(100) { (result: Double, next: Int) -> Double in
    return result + Double(next)
}

print(combinedDouble)

let combinedString: String = myIntStack.reduce("") { (result: String, next: Int) -> String in
    return result + String(next) + " "
}
print(combinedString)


