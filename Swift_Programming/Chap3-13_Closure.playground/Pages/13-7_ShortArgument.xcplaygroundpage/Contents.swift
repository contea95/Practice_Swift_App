let names: [String] = ["wid", "eric", "yagom", "jenny"]

let reversed1: [String] = names.sorted() {
    return $0 > $1
}

let reversed2: [String] = names.sorted() { $0 > $1 }

let reversed3: [String] = names.sorted(by: >)
