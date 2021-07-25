var customersInLine: [String] = ["minjae", "innoceive", "sopress"]

//let customerProvider: () -> String = {
//    return customersInLine.removeFirst()
//}

func returnProvider(_ customerProvider: @autoclosure @escaping () -> String) -> (() -> String) {
    return customerProvider
}

let customerProvider: () -> String = returnProvider(customersInLine.removeFirst())
print("Now serving \(customerProvider())!")

