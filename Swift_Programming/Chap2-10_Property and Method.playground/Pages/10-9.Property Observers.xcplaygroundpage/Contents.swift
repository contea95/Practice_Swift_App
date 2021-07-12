class Account {
    var credit: Int = 0 {
        willSet {
            print("잔액이 \(credit)에서 \(newValue)로 변경될 예정입니다.")
        }
        
        didSet {
            print("잔액이 \(oldValue)에서 \(credit)로 변경되었습니다.")
        }
    }
}

let myAccount: Account = Account()

myAccount.credit = 1000
