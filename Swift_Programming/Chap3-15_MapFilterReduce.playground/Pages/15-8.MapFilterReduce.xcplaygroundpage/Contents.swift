let numbers: [Int] = [1, 2, 3, 4, 5, 6, 7]

// 짝수에 3을 곱하고 다 더한 수
var result: Int = numbers.filter{ $0.isMultiple(of: 2) }.map{ $0 * 3 }.reduce(0){ $0 + $1 }
print(result)

