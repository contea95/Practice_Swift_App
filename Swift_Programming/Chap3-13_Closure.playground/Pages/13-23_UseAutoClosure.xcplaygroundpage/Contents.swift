var customersInLine: [String] = ["YoangWha", "SangYong", "SungHun", "HaMi"]

let customerProvider: () -> String = {
    return customersInLine.removeFirst()
}

func serveCustomer(_ customerProvider: @autoclosure () -> String) {
    print("Now serving \(customerProvider())")
}

serveCustomer(customersInLine.removeFirst())

