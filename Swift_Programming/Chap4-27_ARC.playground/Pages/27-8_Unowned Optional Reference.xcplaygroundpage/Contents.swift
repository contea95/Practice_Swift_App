class Department {
    var name: String
    var subjects: [Subject] = []
    init(name: String) {
        self.name = name
    }
}

class Subject {
    var name: String
    unowned var department: Department
    unowned var nextSubject: Subject?
    init(name: String, in department: Department) {
        self.name = name
        self.department = department
        self.nextSubject = nil
    }
}

let department: Department = Department(name: "Computer Science")

let intro = Subject(name: "Computer Archtecture", in: department)
let intermediate = Subject(name: "Swift Language", in: department)
let advanced = Subject(name: "IOS App Programming", in: department)

intro.nextSubject = intermediate
intermediate.nextSubject = advanced
department.subjects = [intro, intermediate, advanced]

