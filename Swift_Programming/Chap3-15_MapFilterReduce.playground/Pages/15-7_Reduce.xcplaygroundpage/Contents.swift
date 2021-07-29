let numbers: [Int] = [1, 2, 3]

var sum: Int = numbers.reduce(0, { (result: Int, next: Int) -> Int in
    print("\(result) + \(next)")
    return result + next
})

print(sum)

let subtract: Int = numbers.reduce(0, { (result: Int, next: Int) -> Int in
    print("\(result) - \(next)")
    return result - next
})

print(subtract)

// 초기값 3 정수배열 모두 더함
let sumFromThree: Int = numbers.reduce(3) {
    print("\($0) + \($1)")
    return $0 + $1
}

print(sumFromThree)

var subtractFromThree: Int = numbers.reduce(3) {
    print("\($0) - \($1)")
    return $0 - $1
}

print(subtractFromThree)

// 문자열 배열 reduce를 통해 연결
let names: [String] = ["Chope", "Jay", "Joker", "Nova"]

let reducedNames: String = names.reduce("yagom's friend : ") {
    return $0 + " , " + $1
}
print(reducedNames)

sum = numbers.reduce(into: 0, { (result: inout Int, next: Int) in
    print("\(result) + \(next)")
    result += next
})

print(sum)

subtractFromThree = numbers.reduce(into: 3, {
    print("\($0) - \($1)")
    $0 -= $1
})
print(subtractFromThree)

// 홀수는 걸러내고 짝수만 두 배로 변경해 초깃값인 [1,2,3] 배열에 직접 연산
var doubledNumbers: [Int] = numbers.reduce(into: [1, 2]) { (result: inout [Int], next: Int) in
    print("result: \(result) next: \(next)")
    
    guard next % 2 == 0 else {
        return
    }
    
    print("\(result) append \(next)")
    
    result.append(next * 2)
}

print(doubledNumbers)

doubledNumbers = [1, 2] + numbers.filter { $0.isMultiple(of: 2)}.map { $0 * 2 }
print(doubledNumbers)

var upperCasedNames: [String]
upperCasedNames = names.reduce(into: [], {
    $0.append($1.uppercased())
})

print(upperCasedNames)

upperCasedNames = names.map { $0.uppercased() }
print(upperCasedNames)
