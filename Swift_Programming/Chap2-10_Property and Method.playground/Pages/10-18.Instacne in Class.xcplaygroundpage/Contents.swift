class LevelClass {
    var level: Int = 0 {
        didSet{
            print("Level \(level)")
        }
    }
    
    func levelUp() {
        print("Level UP!")
        level += 1
    }
    
    func levelDown() {
        print("Level Down")
        level -= 1
        if level < 0 {
            reset()
        }
    }
    func jumpLevel(to: Int) {
        print("Jump to \(to)")
        level = to
    }
    
    func reset() {
        print("Reset!")
        level = 0
    }
}

var levelClassInstance: LevelClass = LevelClass()
levelClassInstance.levelUp()
levelClassInstance.levelDown()
levelClassInstance.levelDown()
levelClassInstance.jumpLevel(to: 3)
