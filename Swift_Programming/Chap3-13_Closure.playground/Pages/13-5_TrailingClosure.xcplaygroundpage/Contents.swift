let names: [String] = ["wid", "eric", "yagom", "jenny"]

//let reversed: [String] = names.sorted() {(first: String, second) -> Bool in
//    return first > second
//}

let reversed: [String] = names.sorted() { (first, second) in
    return first > second
}


func doSomething(do: (String) -> Void,
                 onSuccess: (Any) -> Void,
                 onFailure: (Error) -> Void) {
    //do something
}

doSomething { (someString: String) in
    // do closure
} onSuccess: { (result: Any) in
    // success closure
} onFailure: { (error: Error) in
    // failure closure
}

