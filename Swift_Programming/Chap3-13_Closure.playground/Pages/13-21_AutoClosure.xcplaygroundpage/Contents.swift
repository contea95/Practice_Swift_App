// 대기중인 손님
var customersInLine: [String] = ["YoangWha", "SangYong", "SungHun", "HaMi"]
print(customersInLine.count)

let customerProvider: () -> String = {
    return customersInLine.removeFirst()
}
print(customersInLine.count)

print("Now serving \(customerProvider())!")
print(customersInLine.count)

