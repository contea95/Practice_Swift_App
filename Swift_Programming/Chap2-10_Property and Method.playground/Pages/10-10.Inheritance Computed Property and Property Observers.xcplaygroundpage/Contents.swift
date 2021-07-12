class Account {
    var credit: Int = 0 {
        willSet {
            print("잔액이 \(credit)원에서 \(newValue)원로 변경될 예정입니다.")
        }
        
        didSet {
            print("잔액이 \(oldValue)원에서 \(credit)원로 변경되었습니다.")
        }
    }
    
    var dollorValue: Double {
        get {
            return Double(credit) / 1000.0
        }
        
        set {
            credit = Int(newValue * 1000)
            print("잔액을 \(newValue)달러로 변경중입니다.")
        }
    }
}

class ForeignAccount: Account {
    override var dollorValue: Double {
        willSet {
            print("잔액이 \(dollorValue)달러에서 \(newValue)달러로 변경될 예정입니다.")
        }
            
        didSet {
            print("잔액이 \(oldValue)달러에서 \(dollorValue)달러로 변경되었습니다.")
        }
    }
}

let myAccount: ForeignAccount = ForeignAccount()

myAccount.credit = 1000

myAccount.dollorValue = 2
