let numbers: [Int] = [0, 1, 2, 3, 4]

var doubledNumbers = numbers.map({ (number: Int) -> Int in
    return number * 2
})

doubledNumbers = numbers.map({ return $0 * 2 })

doubledNumbers = numbers.map({ $0 * 2 })

doubledNumbers = numbers.map { $0 * 2 }

let evenNumbers: [Int] = [0, 2, 4, 6, 8]
let oddNumbers: [Int] = [0, 1, 3, 5, 7]
let multiplyTwo: (Int) -> Int = { $0 * 2 }

let doubledEvenNumbers = evenNumbers.map(multiplyTwo)

let doubledOddNumbers = oddNumbers.map(multiplyTwo)

let alpabetDictionary: [String: String] = ["a": "A", "b": "B"]

var keys: [String] = alpabetDictionary.map { ( tuple: (String, String)) -> String in
    return tuple.0
}

keys = alpabetDictionary.map{ $0.0 }

let values: [String] = alpabetDictionary.map{ $0.1 }

print(keys)
print(values)

var numberSet: Set<Int> = [1,2,3,4,5]
let resultSet = numberSet.map{ $0 * 2 }
print(resultSet)

let optionalInt: Int? = 3
let resultInt: Int? = optionalInt.map{ $0 * 2 }
print(resultInt)

let range: CountableClosedRange = (0...3)
let resultRange: [Int] = range.map{ $0 * 2 }
print(resultRange)
