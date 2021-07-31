func addThree(_ num: Int) -> Int {
    return num + 3
}

addThree(2)

// addThree(Optional(2)) : 이는 오류가 나옴

Optional(2).map(addThree)

var value: Int? = 2
value.map{ $0 + 3 }
value = nil
value.map{ $0 + 3 }

func doubledEven(_ num: Int) -> Int? {
    if num.isMultiple(of: 2) {
        return num * 2
    }
    return nil
}

Optional(2).flatMap(doubledEven)

let optionals: [Int?] = [1, 2, nil, 5]

let mapped: [Int?] = optionals.map{ $0 }
let compactMapped: [Int] = optionals.compactMap{ $0 }

print(mapped)
print(compactMapped)

func stringToInteger(_ string: String) -> Int? {
    return Int(string)
}

func integerToString(_ integer: Int) -> String? {
    return "\(integer)"
}

var optionalString: String? = "2"

let flattenResult = optionalString.flatMap(stringToInteger).flatMap(integerToString).flatMap(stringToInteger)

print(flattenResult)

let mappedResult = optionalString.map(stringToInteger)
print(mappedResult)

func integerToNil(param: Int) -> String? {
    return nil
}

optionalString = "2"
var result: Int?
result = optionalString.flatMap(stringToInteger).flatMap(integerToNil).flatMap(stringToInteger)

print(result)
