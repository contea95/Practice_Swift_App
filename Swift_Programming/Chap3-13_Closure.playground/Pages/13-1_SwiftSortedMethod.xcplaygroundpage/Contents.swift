let names: [String] = ["wid", "eric", "yagom", "jenny"]

func backwards(first: String, second: String) -> Bool {
    print("\(first) \(second) 비교중")
    return first > second
}

let reversed1: [String] = names.sorted(by: backwards(first:second:))
print(reversed1)


let reverse: [String] = names.sorted(by: { (first: String, second: String) -> Bool in
    return first > second
})
print(reverse)
