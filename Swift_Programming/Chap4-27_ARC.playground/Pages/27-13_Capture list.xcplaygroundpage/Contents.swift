class SimpleClass {
    var value: Int = 0
}

var x: SimpleClass? = SimpleClass()
var y = SimpleClass()

let closure = { [weak x, unowned y] in
    print(x?.value, y.value)
}

x = nil
y.value = 10

closure()
